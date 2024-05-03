IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##

REM DESINSTALLER APPS
START /WAIT "" powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp0Remove-MS-Store-Apps.ps1"  -List "%~dp0w11-22H2-apps-provisioned_EBSI.txt" -L "%WinDir%\Temp"

REM SUPPRIMER LOGICIELS MENU DEMARRER


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
SET errorlevel=0
