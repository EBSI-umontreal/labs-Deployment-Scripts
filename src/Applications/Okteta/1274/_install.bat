IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0okteta-master-1274-windows-msvc2019_64-cl.exe" /S


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
