IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0audacity-win-3.4.2-64bit.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS="!desktopicon"


REM ## ADJUSTMENTS ##
DEL "%ProgramFiles(x86)%\Audacity\FirstTime.ini" /Q


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Audacity 3.4.2"
MOVE /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Audacity.lnk" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Audacity 3.4.2"


REM ******************** FILES ********************
MKDIR "%defaultUserFolder%\AppData\Roaming\Audacity"
COPY "%~dp0audacity.cfg" "%defaultUserFolder%\AppData\Roaming\Audacity" /Y

REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
