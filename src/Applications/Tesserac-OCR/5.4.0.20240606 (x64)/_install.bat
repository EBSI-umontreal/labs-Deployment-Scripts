IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0tesseract-ocr-w64-setup-5.4.0.20240606.exe" /S



REM ## ADJUSTMENTS ##
START /WAIT "" powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp0PATH-variable-add.ps1"


REM ## STARTMENU ##
RENAME "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Tesseract-OCR" "Tesseract-OCR 5.4"
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Tesseract-OCR 5.4\Uninstall.lnk" /F


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
