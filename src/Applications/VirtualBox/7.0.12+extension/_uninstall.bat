IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##

START /WAIT msiexec.exe /qn /norestart /x {32B822F6-0014-44F1-B755-8146EBA5A8E3}
RMDIR "%ProgramFiles%\Oracle\VirtualBox\ExtensionPacks" /S /Q


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
RMDIR "%defaultUserFolder%\.VirtualBox" /S /Q







REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
