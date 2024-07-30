IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
REM copie courante
RMDIR "%PROGRAMFILES(X86)%\verapdf" /S /Q



REM copie restauration
RMDIR "%PROGRAMFILES(X86)%\EBSI\veraPDF" /S /Q


DEL "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Startup\scripts\VeraPDF.bat" /F



REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\veraPDF" /S /Q



REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
