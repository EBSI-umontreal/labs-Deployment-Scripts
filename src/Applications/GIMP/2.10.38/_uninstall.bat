IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%ProgramFiles%\GIMP 2\uninst\unins000.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
RMDIR "%ProgramFiles%\GIMP 2" /S /Q


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
RMDIR "%defaultUserFolder%\AppData\Roaming\GIMP\2.10" /S /Q



REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
