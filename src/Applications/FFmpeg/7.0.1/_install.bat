IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp07z.exe" x "%~dp0ffmpeg-7.0.1-full_build.7z" -o"%ProgramFiles%" -aoa
:LOOP
ping 127.0.0.1 -n 5 > nul
RENAME "%ProgramFiles%\ffmpeg-7.0.1-full_build" "FFmpeg"
IF NOT EXIST "%ProgramFiles%\FFmpeg" GOTO LOOP
:SUITE


REM ## ADJUSTMENTS ##
START /WAIT "" powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp0PATH-variable_v2.ps1" add "C:\Program Files\FFmpeg\bin"


REM ## STARTMENU ##


REM ## SENDTO ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
