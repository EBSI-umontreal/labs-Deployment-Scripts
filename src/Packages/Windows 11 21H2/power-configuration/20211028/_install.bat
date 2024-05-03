IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
powercfg /import "%~dp0ebsi-w11-21h2.pow" 9078dd8f-d1c2-4f77-b117-3bea84d2d9f6
powercfg /setactive 9078dd8f-d1c2-4f77-b117-3bea84d2d9f6


REM ## ADJUSTMENTS ##

rem Disable Hibernate
powercfg -h off

rem Turn off sleep mode
powercfg.exe -x -standby-timeout-ac 0


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
