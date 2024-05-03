IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0AxureRP-Setup.exe" /S MODIFY=FALSE REMOVE=TRUE UNINSTALL=YES


REM ## ADJUSTMENTS ##
DEL "%ProgramFiles(x86)%\Axure\Axure RP 8\lic.key" " /Q
for /F %%i in ('dir /b "%ProgramFiles(x86)%\Axure\Axure RP 8\*.*"') do (
   goto :EOF
)
RMDIR "%ProgramFiles(x86)%\Axure" /S /Q
:END


REM ## STARTMENU ##



REM ******************** FILES ********************



REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
