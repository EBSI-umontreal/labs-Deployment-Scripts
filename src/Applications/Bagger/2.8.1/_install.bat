IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%PROGRAMFILES(X86)%\bagger"
ROBOCOPY "%~dp0bagger-2.8.1" "%PROGRAMFILES(X86)%\bagger" /MIR


REM ## ADJUSTMENTS ##
XCOPY "%~dp0EBSI\*" "%PROGRAMFILES(X86)%\bagger" /Y /S


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Bagger 2.8.1"
cscript "%~dp0shortcut.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Bagger 2.8.1\Bagger.lnk" "%PROGRAMFILES(X86)%\bagger\bagger.bat"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
