IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
REM START /WAIT "" "%ProgramFiles%\Hybrid\unins000.exe" /SILENT
RMDIR "%ProgramFiles%\Hybrid" /s /q



REM ## ADJUSTMENTS ##


REM ## STARTMENU ##

RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Hybrid"  /s /q





REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
