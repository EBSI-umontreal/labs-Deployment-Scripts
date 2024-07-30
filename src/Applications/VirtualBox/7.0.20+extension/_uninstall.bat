IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##

START /WAIT msiexec.exe /qn /norestart /x {A6646BFE-4583-48FF-9029-FF9D1B3C3B53}
RMDIR "%ProgramFiles%\Oracle\VirtualBox\ExtensionPacks" /S /Q


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
RMDIR "%defaultUserFolder%\.VirtualBox" /S /Q







REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
