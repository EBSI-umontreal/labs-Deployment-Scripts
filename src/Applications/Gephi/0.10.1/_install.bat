IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0gephi-0.10.1-windows-x64.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-


REM ## ADJUSTMENTS ##
del "%PUBLIC%\Desktop\Gephi.lnk" /F


REM ## STARTMENU ##
del "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Gephi\Startup settings.lnk" /F


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
