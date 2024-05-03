IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##

REM v. 20210712
START /WAIT /B "" "gpupdate" /force >>"%WinDir%\TEMP\postOSDScript.log" 2>&1
START /WAIT /B "" "dsregcmd" /join >>"%WinDir%\TEMP\postOSDScript.log" 2>&1
START /WAIT "" "shutdown" /r /t 120 /f >>"%WinDir%\TEMP\postOSDScript.log" 2>&1


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
