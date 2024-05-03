IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0QCTools_1.3.1_Windows.exe" /S


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\MediaArea QCTools"
cscript "%~dp0shortcut-v2.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\MediaArea QCTools\MediaArea QCTools 1.3.1.lnk" "%PROGRAMFILES%\QCTools\QCTools.exe"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
