IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0Win64CmapTools_v6.04_09-24-19" -i silent


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
DEL "%ProgramData%\Microsoft\Windows\Start Menu\Programs\IHMC CmapTools\Uninstall CmapTools.lnk" /F
RENAME "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\IHMC CmapTools" "CmapTools 6.04"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
