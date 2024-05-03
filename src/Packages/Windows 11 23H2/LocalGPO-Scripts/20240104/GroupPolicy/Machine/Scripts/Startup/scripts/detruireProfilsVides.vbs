Option Explicit
'On Error Resume Next

dim oFS, DossierProfils, profilsRestants, profilEnCours
DossierProfils = "C:\Users"
set oFS = WScript.CreateObject("Scripting.FileSystemObject")

WScript.Echo "Destruction des dossiers et profils vides"
set profilsRestants = oFS.getFolder(DossierProfils).subFolders
for each profilEnCours in profilsRestants
	if (not profilEnCours.name = "All Users") AND (not profilEnCours.name = "Default") AND (not profilEnCours.name = "Default User") AND (not profilEnCours.name = "Default.original") AND (not profilEnCours.name = "Public") then
		If not oFS.FileExists(DossierProfils & "\" & profilEnCours.name & "\NTUSER.DAT") then
			Wscript.Echo "A DETRUIRE : " & profilEnCours
			profilEnCours.delete
		end if
	end if
next
