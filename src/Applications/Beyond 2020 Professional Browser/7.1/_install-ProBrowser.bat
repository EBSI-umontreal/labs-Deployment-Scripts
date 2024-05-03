IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
start /wait msiexec.exe /qn /norestart /i "%~dp0ProBrowser.msi"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
MOVE /y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Beyond 2020\Professional Browser" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\"
RMDIR "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Beyond 2020" /S /Q
RENAME "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Professional Browser" "Beyond 2020 Professional Browser 7.1"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
