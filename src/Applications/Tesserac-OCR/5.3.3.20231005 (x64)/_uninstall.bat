IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
 START /WAIT "" "%programfiles%\Tesseract-OCR\tesseract-uninstall.exe" /S



REM ## ADJUSTMENTS ##
START /WAIT "" powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp0PATH-variable-del.ps1"


REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Tesseract-OCR 5.3" /S /Q



REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
