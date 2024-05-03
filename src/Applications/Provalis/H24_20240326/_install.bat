IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ***********************************************************
REM *************** INSTALL/UNINSTALL (LICENCE) ***************
REM ***********************************************************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%PUBLIC%\Provalis Research"
ROBOCOPY "%~dp0Public" "%PUBLIC%\Provalis Research" /MIR


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************



REM ***********************************************************
REM *********** INSTALL/UNINSTALL (Provalis Suite) ************
REM ***********************************************************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0Suite\SetupQSW.exe" /SILENT /NORESTART


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
DEL "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Provalis Research\D?sinstaller Provalis Suite.lnk" /F
DEL "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Provalis Research\D?sinstaller WebCollector.lnk" /F


REM ******************** FILES ********************





REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
