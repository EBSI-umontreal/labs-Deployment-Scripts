IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%PROGRAMFILES(X86)%\Timothy C. Craven"
ROBOCOPY "%~dp0Timothy C. Craven" "%PROGRAMFILES(X86)%\Timothy C. Craven" /MIR


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\TexNet32 1.4.3B6"
cscript "%~dp0shortcut.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\TexNet32 1.4.3B6\TexNet32.lnk" "%PROGRAMFILES(X86)%\Timothy C. Craven\TexNet32\tn32.exe"
cscript "%~dp0shortcut.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\TexNet32 1.4.3B6\Aide TexNet32.lnk" "%PROGRAMFILES(X86)%\Timothy C. Craven\TexNet32\texnet32.chm"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
