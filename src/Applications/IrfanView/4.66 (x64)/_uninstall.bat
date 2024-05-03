IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
if exist "%programfiles%\IrfanView\iv_uninstall.exe" START /WAIT "" "%programfiles%\IrfanView\iv_uninstall.exe" /silent





REM ## ADJUSTMENTS ##
if exist "%programfiles%\IrfanView" RMDIR "%programfiles%\IrfanView"  /S /Q



REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\IrfanView 4.66" /S /Q









REM ******************** FILES ********************
REM DEFAULT USER
RMDIR "%defaultUserFolder%\AppData\Roaming\IrfanView" /S /Q






REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
