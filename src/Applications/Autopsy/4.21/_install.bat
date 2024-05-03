IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0autopsy-4.21.0-64bit.msi"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
del "C:\Users\Public\Desktop\Autopsy 4.21.0.lnk" /Q


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
