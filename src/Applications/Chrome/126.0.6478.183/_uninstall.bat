IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT



REM ## ADJUSTMENTS ##
DEL "%ProgramFiles(x86)%\Google\Chrome\Application\master_preferences" /F


REM ## STARTMENU ##




REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************
REM REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Update" /F






REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
