IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0PBIDesktopSetup_x64.exe"  -silent -norestart ACCEPT_EULA=1 INSTALLDESKTOPSHORTCUT=0 DISABLE_UPDATE_NOTIFICATION=1


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ## SENDTO ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
