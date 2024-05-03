IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /i "%~dp0MSI\Bizagi Modeler.msi" ISSETUPDRIVEN=1 /qb /norestart


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
DEL "%PUBLIC%\Desktop\Bizagi Modeler.lnk" /F

MKDIR "%defaultUserFolder%\AppData\Roaming\Bizagi Ltd\Bizagi Process Modeler"
ROBOCOPY "%~dp0Roaming\Bizagi Ltd" "%defaultUserFolder%\AppData\Roaming\Bizagi Ltd" /mir


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
