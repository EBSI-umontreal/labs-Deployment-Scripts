IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /V HiberbootEnabled /T REG_dWORD /D 0 /F


REM ************ DEFAULT USER REGISTRY ************
