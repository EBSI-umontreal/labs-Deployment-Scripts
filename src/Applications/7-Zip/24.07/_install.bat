IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
REM START /WAIT "" "%~dp07z2407-x64.exe" /S
START /WAIT "" powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp07-Zip-Install.ps1"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RENAME "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\7-Zip" "7-Zip 24.07"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG ADD "HKU\DefaultUser\Software\7-Zip"         /v "Lang"         /t REG_SZ    /d "fr"       /f
REG ADD "HKU\DefaultUser\Software\7-Zip\Options" /v "CascadedMenu" /t REG_DWORD /d 1          /f
REG ADD "HKU\DefaultUser\Software\7-Zip\Options" /v "ContextMenu"  /t REG_DWORD /d 2147488631 /f
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
