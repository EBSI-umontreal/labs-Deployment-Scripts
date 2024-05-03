IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
RMDIR "%ProgramFiles%\RAWcooked" /S /Q



REM ## ADJUSTMENTS ##
REM setx /M PATH "%PATH:C:\Program Files\RAWcooked;=%"
START /WAIT "" powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp0PATH-variable-del.ps1"


REM ## STARTMENU ##


REM ## SENDTO ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
