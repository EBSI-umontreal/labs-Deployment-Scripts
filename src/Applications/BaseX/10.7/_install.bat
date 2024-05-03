IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "C:\INU3011"
START /WAIT "" "%~dp07z.exe" x "%~dp0BaseX107.zip" -o"C:\INU3011" -aoa
:LOOP
TIMEOUT 5
RENAME "C:\INU3011\basex" "BaseX107"
IF NOT EXIST "C:\INU3011\BaseX107" GOTO LOOP
:SUITE
ROBOCOPY "%~dp0EBSI" "C:\INU3011\BaseX107" *.* /E


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
