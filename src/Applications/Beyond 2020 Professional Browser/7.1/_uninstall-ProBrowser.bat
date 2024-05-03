IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
start /wait msiexec.exe /qn /norestart /x "%~dp0ProBrowser.msi"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Beyond 2020 Professional Browser 7.1" /S /Q




REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
