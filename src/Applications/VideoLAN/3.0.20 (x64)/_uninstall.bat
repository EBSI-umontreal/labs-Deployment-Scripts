IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
if exist "%PROGRAMFILES%\VideoLAN\VLC\uninstall.exe" "%PROGRAMFILES%\VideoLAN\VLC\uninstall.exe" /S



REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\VideoLAN 3.0.20" /S /Q




REM ******************** FILES ********************
RMDIR "%defaultUserFolder%\AppData\Roaming\vlc" /S /Q






REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
