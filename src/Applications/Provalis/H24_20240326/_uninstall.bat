IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ***********************************************************
REM *************** INSTALL/UNINSTALL (LICENCE) ***************
REM ***********************************************************
REM ## INSTALL/UNINSTALL PROGRAM ##
RMDIR "%PUBLIC%\Provalis Research" /S /Q



REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************



REM ***********************************************************
REM *********** INSTALL/UNINSTALL (Provalis Suite) ************
REM ***********************************************************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%PROGRAMDATA%\Provalis Research\unins000.exe" /SILENT


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Provalis Research" /S /Q



REM ******************** FILES ********************
RMDIR "%PROGRAMDATA%\Provalis Research\" /S /Q
if exist "%programfiles%\Provalis Research" RMDIR "%programfiles%\Provalis Research" /S /Q
if exist "%ProgramFiles(x86)%\Provalis Research" RMDIR "%ProgramFiles(x86)%\Provalis Research" /S /Q


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
