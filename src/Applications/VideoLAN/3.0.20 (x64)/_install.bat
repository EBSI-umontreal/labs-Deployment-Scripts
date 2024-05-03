IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0vlc-3.0.20-win64.exe" /L=1036 /S



REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\VideoLAN" /S /Q
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\VideoLAN 3.0.20"
cscript "%~dp0shortcut.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\VideoLAN 3.0.20\VLC media player.lnk" "%PROGRAMFILES%\VideoLAN\VLC\vlc.exe"


REM ******************** FILES ********************
mkdir "%defaultUserFolder%\AppData\Roaming\vlc"
ROBOCOPY "%~dp0Roaming" "%defaultUserFolder%\AppData\Roaming\vlc" *.* /E

REM Icone bureau
del "%PUBLIC%\Desktop\VLC media player.lnk" /F


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
