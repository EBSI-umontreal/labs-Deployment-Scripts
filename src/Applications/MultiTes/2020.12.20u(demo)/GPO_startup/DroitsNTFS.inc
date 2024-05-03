'#############################

'Function CheckPermissions 

'Variables
  'ComputerName (use GetServerFromUNC function if necessary)
  'ExplicitPath (i.e. e:\data\folder - use GetExplicitPathFromUNC function if necessary)
  'UserOrGroupName
  
'Returns 
  '0 if group or user is found with Read permission
  '1 if group or user is found with Modify permission
  '2 if group or user is found with Full permission
  '3 if group or user is found with any other permission
  '4 if group or user does not have any permissions on this folder

  Function CheckPermissions(ComputerName,ExplicitPath,UserOrGroupName)
  
    Found = 0

'Create the security object. You have to invoke the Security and Restore Priviledges in the 
'script to make changes to ACEs
    Set objSecurity = GetObject("winmgmts:{(Security,Restore)}\\" & ComputerName & _
        "\root\cimv2:Win32_LogicalFileSecuritySetting='" & ExplicitPath & "'")
  
'Create the Security Descriptor object (objSD)
    If objSecurity.GetSecurityDescriptor(objSD) = 0 Then
'Loop through every ACE in the DACL, and see if the User or Group Name specified
'has a ACE in the DACL. If so, set the FOUND Flag to 1
      For Each objACE in objSD.DACL
        If ucase(objACE.Trustee.Name) = ucase(UserOrGroupName) Then
          
'Found a match. Check the permissions level
          PermissionBitMask = objACE.AccessMask
          
          Select Case PermissionBitMask
            Case 1179817
              CheckPermissions = 0
            Case 1245631
              CheckPermissions = 1
            Case 2032127
              CheckPermissions = 2
            Case Else
              CheckPermissions = 3
          End Select
          
          Found = 1
        End If
      
      Next
    
    End If

'If Found still equals 0, then the specified User or Group was never found. 
    If Found = 0 Then
      CheckPermissions = 4
    End If
    
  End Function
  
'#############################





'#############################

'Function SetPermissions 

'Variables
  'DomainName
  'ComputerName (use GetServerFromUNC function if necessary)
  'ExplicitPath (i.e. e:\data\folder - use GetExplicitPathFromUNC function if necessary)
  'UserOrGroupName
  'Permission (Read,Modify,Full)
  
'Returns 
  '0 if successful
  '1 if failed

  Function SetPermissions(DomainName,ComputerName,ExplicitPath,UserOrGroupName,Permission)
  
    Found = 0

'Create the security object. You have to invoke the Security and Restore Priviledges in the 
'script to make changes to ACEs
    Set objSecurity = GetObject("winmgmts:{(Security,Restore)}\\" & ComputerName & _
        "\root\cimv2:Win32_LogicalFileSecuritySetting='" & ExplicitPath & "'")

'Determine which Permission to be applied
    If ucase(Permission) = "READ" Then PermissionBitMask = 1179817
    If ucase(Permission) = "MODIFY" Then PermissionBitMask = 1245631
    If ucase(Permission) = "FULL" Then PermissionBitMask = 2032127
  
'Create the Security Descriptor object (objSD) and then add, modify, or delete ACEs inside
'the DACL.

'Loop through every ACE in the DACL, and see if the User or Group Name specified already
'has a ACE in the DACL. If so, alter the AccessMask and set the FOUND Flag to 1
    If objSecurity.GetSecurityDescriptor(objSD) = 0 Then
      For Each objACE in objSD.DACL
        If ucase(objACE.Trustee.Name) = ucase(UserOrGroupName) Then
          objACE.AccessMask = PermissionBitMask
          Found = 1
        End If
      Next
    End If

'If Found = 1, then the specified User or Group was modified. Use SetSecurityDescriptor 
'to save the changes.
    If Found = 1 Then
      If objSecurity.SetSecurityDescriptor(objSD) = 0 Then
        SetPermissions = 0
      Else
        SetPermissions = 1
        Err.Clear
      End If
    Else
    
'Specified User or Group was NOT found in the existing DACL. Add a new ACE to the
'DACL

'(1) Get the SID of the user or group account.

'Create a WMI object on the local computer (Assuming the local computer is in the
'same domain (or in a trusted domain) as the one specified
      Set objWMI = GetObject("winmgmts:\\.\root\cimv2")

'Get a collection of Users objects, using ExecQuery
      Set colUsers = objWMI.ExecQuery("SELECT * FROM WIN32_ACCOUNT WHERE Domain = '" & _
          DomainName & "' AND Name = '" & UserOrGroupName & "'")
  
'The collection should only have one user in it. Loop through the one user collection
'and create a user object
      For Each UserName in colUsers
        Set objUserName = UserName
      Next
  
'Next, we need both the binary and string representation of the user's SID to create a new
'Win32_Trustee. objUser.SID only returns the string version. Create a Win32_SID object by
'referencing the objUser's SID
      Set objSID = objWMI.Get("Win32_SID.SID='" & objUserName.SID & "'")


'(2) Create a new blank Win32_Trustee object, and set it's properties to the appropriate
'    values

'Create a new blank Win32_Trustee object
      Set objTrusteeClass = objWMI.Get("Win32_Trustee")
      Set objTrustee = objTrusteeClass.SpawnInstance_()
  
'Set the properties
      objTrustee.Domain = objSID.ReferencedDomainName
      objTrustee.Name = objSID.AccountName
      objTrustee.SID = objSID.BinaryRepresentation
      objTrustee.SidLength = objSID.SidLength
      objTrustee.SIDString = objSID.SID
  
  
'(3) Create a new blank Win32_ACE object, and set it's properties to the appropriate
'    values. The Trustee property should point to the newly created Win32_Trustee

'Create a new blank Win32_ACE object
      Set objACEClass = objWMI.Get("Win32_ACE")
      Set objACE = objACEClass.SpawnInstance_()
  
'Set the properties
      objACE.AccessMask = PermissionBitMask
      objACE.Trustee = objTrustee
      objACE.AceType = 0 'Allow
      objACE.AceFlags = 3 'Inheritance to sub-folders and files
  

'(4) Add the ACE to the DACL. This is the hard part, because to keep the existing
'    ACEs means we have to resize the array. The DACL array is not a dynamic array, so 
'    the solution is to create a new array of the right size, copy the explicit contents 
'    of the existing DACL (and the new ACE) into it, and then replace the existing 
'    DACL with the new one.

'Create a Dictionary object (a hash). We're using a dictionary object, because it
'can be dynamically resized
      Set objDictionary = CreateObject("Scripting.Dictionary")

'Loop through the DACL array and populate the Dictionary object only with ACE objects
'that have EXPLICIT PERMISSIONS.  This can be tested by checking the AceFlags property.
'If the 5th bit (16) is set to 1 then, the permission is inherited (See AceFlags
'description above.
'Doesn't matter what the Dictionary key is, The corresponding item is all that matters,
'being the ACE of the existing DACL. We just use i as the key here
      For i = LBound(objSD.DACL) to UBound(objSD.DACL)
        If NOT objSD.DACL(i).AceFlags AND 16 Then
          objDictionary.Add i, objSD.DACL(i)
        End If
      Next
  
'Add the new ACE. 
      objDictionary.Add "Empty Key", objACE
  
'Use the items method to return a list of just the items, and overwrite the existing 
'DACL with the new list of ACEs
      objSD.DACL = objDictionary.Items
  

'(5) Finally, write back the Security Descriptor
      If objSecurity.SetSecurityDescriptor(objSD) = 0 Then
        SetPermissions = 0
      Else
        SetPermissions = 1
        Err.Clear
      End If
    
    End If

  End Function
  
'#############################





'#############################
 
'Function AllowInheritance 

'Variables
  'ComputerName (use GetServerFromUNC function if necessary)
  'ExplicitPath (i.e. e:\data\folder - use GetExplicitPathFromUNC function if necessary)
    
'Returns 
  '0 if inheritance is set to be allowed successfully
  '1 if the function fails to set inheritance
  '2 if inheritance is already allowed
  '3 if the function fails to connect to the Security Descriptor
  '4 if the function fails to connect to the WMI object
  
  Function AllowInheritance(ComputerName,ExplicitPath)
  
'Create the security object. You have to invoke the Security and Restore Priviledges in the 
'script to make changes to ACEs
    Set objSecurity = GetObject("winmgmts:{(Security,Restore)}\\" & ComputerName & _
        "\root\cimv2:Win32_LogicalFileSecuritySetting='" & ExplicitPath & "'")
    
    If Err.Number = 0 Then
      
'Create the Security Descriptor object (objSD)
      If objSecurity.GetSecurityDescriptor(objSD) = 0 Then
 
'Security Descriptor ControlFlags returns a bitmask.  4096 (1000000000000) 
'is the bit that is set to block inheritance
    
'Check to see if Inheritance is allowed or blocked    
        If objSD.ControlFlags AND 4096 Then
      
'Blocked. Unset the bit to allow inheritance
          objSD.ControlFlags = objSD.ControlFlags XOR 4096
          
     
'Set the Security Descriptor to save the changes
          If objSecurity.SetSecurityDescriptor(objSD) = 0 Then
            AllowInheritance = 0
          Else
            AllowInheritance = 1
            Err.Clear
          End If

'Not blocked
        Else
          AllowInheritance = 2 
        End If

'Function failed to connect to the Security Descriptor       
      Else
        AllowInheritance = 3
        Err.Clear
      End If

'Function failed to connect to the WMI object
    Else
      AllowInheritance = 4
      Err.Clear
    End If

  End Function
          
'#############################





'#############################
 
'Function BlockInheritance 

'Variables
  'ComputerName (use GetServerFromUNC function if necessary)
  'ExplicitPath (i.e. e:\data\folder - use GetExplicitPathFromUNC function if necessary)
    
'Returns 
  '0 if inheritance is blocked successfully
  '1 if the function fails to set inheritance
  '2 if inheritance is already blocked
  '3 if the function fails to connect to the Security Descriptor
  '4 if the function fails to connect to the WMI object
  
  Function BlockInheritance(ComputerName,ExplicitPath)
  
'Create the security object. You have to invoke the Security and Restore Priviledges in the 
'script to make changes to ACEs
    Set objSecurity = GetObject("winmgmts:{(Security,Restore)}\\" & ComputerName & _
        "\root\cimv2:Win32_LogicalFileSecuritySetting='" & ExplicitPath & "'")
    
    If Err.Number = 0 Then
      
'Create the Security Descriptor object (objSD)
      If objSecurity.GetSecurityDescriptor(objSD) = 0 Then
 
'Security Descriptor ControlFlags returns a bitmask.  4096 (1000000000000) 
'is the bit that is set to block inheritance
    
'Check to see if Inheritance is allowed or blocked    
        If objSD.ControlFlags AND 4096 Then
      
'Blocked. 
          BlockInheritance = 2
        Else

'Not blocked. Set the bit to block inheritance
          objSD.ControlFlags = objSD.ControlFlags OR 4096
                    
               
'Set the Security Descriptor to save the changes
          If objSecurity.SetSecurityDescriptor(objSD) = 0 Then
            AllowInheritance = 0
          Else
            AllowInheritance = 1
            Err.Clear
         End If
       End If

'Function failed to connect to the Security Descriptor       
      Else
        BlockInheritance = 3
        Err.Clear
      End If

'Function failed to connect to the WMI object
    Else
      BlockInheritance = 4
      Err.Clear
    End If

  End Function
          
'#############################
