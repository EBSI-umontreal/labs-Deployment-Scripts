IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************
"%~dp0SetACL_x64.exe" -on "HKEY_CLASSES_ROOT\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" -ot reg -actn setowner -ownr "n:Administrateurs"
"%~dp0SetACL_x64.exe" -on "HKEY_CLASSES_ROOT\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" -ot reg -actn ace -ace "n:Administrateurs;p:full"
reg.exe add "HKEY_CLASSES_ROOT\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v Attributes /d 0xb0940064 /t REG_DWORD /f

"%~dp0SetACL_x64.exe" -on "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Classes\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" -ot reg -actn setowner -ownr "n:Administrateurs"
"%~dp0SetACL_x64.exe" -on "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Classes\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" -ot reg -actn ace -ace "n:Administrateurs;p:full"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Classes\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v Attributes /d 0xb0940064 /t REG_DWORD /f


REM ************ DEFAULT USER REGISTRY ************
