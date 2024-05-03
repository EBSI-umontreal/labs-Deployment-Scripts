IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0AxureRP-Setup.exe" /S


REM ## ADJUSTMENTS ##
COPY "%~dp0lic.key" "%ProgramFiles(x86)%\Axure\Axure RP 8" /Y







REM ## STARTMENU ##
del "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Axure\Uninstall Axure RP 8.lnk" /F


REM ******************** FILES ********************
DEL "%PUBLIC%\Desktop\Axure RP 8.lnk" /F


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
