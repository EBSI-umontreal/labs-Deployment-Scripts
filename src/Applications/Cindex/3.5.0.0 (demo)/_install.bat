IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0CindexDemoSetup.exe" /VERYSILENT


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
DEL "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Cindex 3.0 Demo\Uninstall Cindex.lnk" /Q


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
