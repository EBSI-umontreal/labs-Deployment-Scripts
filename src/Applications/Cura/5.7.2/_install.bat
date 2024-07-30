IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0UltiMaker-Cura-5.7.2-win64-X64.exe" /S


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Ultimaker Cura\Uninstall Ultimaker Cura 5.7.2.lnk" /F


REM ******************** FILES ********************
MKDIR "%defaultUserFolder%\AppData\Roaming\cura"
ROBOCOPY "%~dp0Roaming\cura" "%defaultUserFolder%\AppData\Roaming\cura" /mir


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
