IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0R-4.2.2-win.exe" /VERYSILENT
START /WAIT "" "%~dp0RStudio-2022.07.2-576.exe" /S


REM ## ADJUSTMENTS ##
ICACLS "%PROGRAMFILES%\R\R-4.2.2\library" /grant .\Utilisateurs:(OI)(CI)F


REM ## STARTMENU ##


REM ******************** FILES ********************
ping 127.0.0.1 -n 10 > nul
del "%PUBLIC%\Desktop\R 4.2.2.lnk" /F


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
