IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%ProgramFiles%\ATOMI\ActivePresenter\unins000.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\ActivePresenter 9.1.5" /S /Q



REM ******************** FILES ********************
RMDIR "%defaultUserFolder%\AppData\Roaming\ActivePresenter" /S /Q



REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
