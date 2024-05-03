IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0Xena 6.1.0 Setup.exe" /quiet



REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
MOVE /y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\National Archives of Australia\Xena" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\"
RMDIR "%ProgramData%\Microsoft\Windows\Start Menu\Programs\National Archives of Australia" /S /Q
RENAME "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Xena" "Xena 6.1.0"
DEL "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Xena 6.1.0\Uninstall.lnk" /F
DEL "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Xena 6.1.0\Check for Updates.lnk" /F

REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
