IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /x {00ED6B45-03F8-43C6-A640-68F967BDF9D4}



REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Xena 6.1.0" /S /Q





REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
