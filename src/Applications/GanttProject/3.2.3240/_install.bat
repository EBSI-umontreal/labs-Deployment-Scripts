IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0ganttproject-3.2.3240.exe" /S


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\GanttProject\Uninstall.lnk" /F


REM ******************** FILES ********************
DEL "%PUBLIC%\Desktop\GanttProject.lnk" /F
COPY "%~dp0.ganttproject" "%defaultUserFolder%" /Y


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
