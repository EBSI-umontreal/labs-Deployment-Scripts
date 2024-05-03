IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0MediaInfo_GUI_23.10_Windows.exe" /S



REM ## ADJUSTMENTS ##
MKDIR "%defaultUserFolder%\AppData\Roaming\MediaInfo"
ROBOCOPY "%~dp0Roaming\MediaInfo" "%defaultUserFolder%\AppData\Roaming\MediaInfo" /mir
MKDIR "%defaultUserFolder%\AppData\Roaming\MediaInfo\Plugin"
ROBOCOPY "%ProgramFiles%\MediaInfo\Plugin" "%defaultUserFolder%\AppData\Roaming\MediaInfo\Plugin" /mir


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\MediaInfo"
cscript "%~dp0shortcut-v2.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\MediaInfo\MediaInfo 23.10.lnk" "%ProgramFiles%\MediaInfo\MediaInfo.exe"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
