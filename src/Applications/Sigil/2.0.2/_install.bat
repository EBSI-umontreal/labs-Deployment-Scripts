IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0Sigil-2.0.2-Windows-x64-Setup.exe"  /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Sigil\Uninstall Sigil.lnk"
DEL "%PUBLIC%\Desktop\Sigil.lnk"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
