IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%ProgramFiles%\RAWcooked"
START /WAIT "" "%~dp07z.exe" x "%~dp0RAWcooked_CLI_23.12_Windows_x64.zip" -o"%ProgramFiles%\RAWcooked" -aoa


REM ## ADJUSTMENTS ##
REM setx /M PATH "%PATH%;C:\Program Files\RAWcooked;"
START /WAIT "" powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp0PATH-variable-add.ps1"


REM ## STARTMENU ##


REM ## SENDTO ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
