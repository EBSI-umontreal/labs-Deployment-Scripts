IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
RMDIR "%PROGRAMFILES(X86)%\Timothy C. Craven" /S /Q



REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\TexNet32 1.4.3B6" /S /Q




REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
