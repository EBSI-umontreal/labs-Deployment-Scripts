IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%PROGRAMFILES(X86)%\jhove"
ROBOCOPY "%~dp0jhove-1.28" "%PROGRAMFILES(X86)%\jhove" /MIR


REM ## ADJUSTMENTS ##
XCOPY "%~dp0EBSI\*" "%PROGRAMFILES(X86)%\jhove" /Y /S


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\JHOVE"
cscript "%~dp0shortcut.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\JHOVE\JHOVE GUI 1.28.lnk" "%PROGRAMFILES(X86)%\jhove\jhove-gui.bat"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
