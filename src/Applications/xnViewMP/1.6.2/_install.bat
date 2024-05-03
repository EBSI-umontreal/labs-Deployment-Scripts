IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp07z.exe" x "%~dp0XnViewMP-win-x64.zip" -o"%ProgramFiles%" -aoa


REM ## ADJUSTMENTS ##
MKDIR "%defaultUserFolder%\AppData\Roaming\XnViewMP"
COPY "%~dp0xnview.ini" "%defaultUserFolder%\AppData\Roaming\XnViewMP" /Y


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\XnViewMP"
cscript "%~dp0shortcut-v2.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\XnViewMP\XnViewMP 1.6.2.lnk" "%ProgramFiles%\XnViewMP\xnviewmp.exe"


REM ## SENDTO ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
