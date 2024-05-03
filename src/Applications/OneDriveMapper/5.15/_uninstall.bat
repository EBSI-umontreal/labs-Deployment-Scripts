IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##

RMDIR "%ProgramFiles(x86)%\OneDriveMapper" /S /Q


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
DEL "%defaultUserFolder%\Desktop\Lecteur O - OneDrive UdeM.lnk" /Q


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************









REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
