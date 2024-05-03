IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0gimp-2.10.36-setup.exe" /VERYSILENT /NORESTART /RESTARTEXITCODE=3010 /SUPPRESSMSGBOXES /SP- 



REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
mkdir "%defaultUserFolder%\AppData\Roaming\GIMP\2.10"
ROBOCOPY "%~dp0Roaming\GIMP\2.10" "%defaultUserFolder%\AppData\Roaming\GIMP\2.10" *.* /E


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
