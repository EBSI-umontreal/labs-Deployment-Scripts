IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "C:\INU3011\SaxonHE11-4J"
START /WAIT "" "%~dp07z.exe" x "%~dp0SaxonHE11-4J.zip" -o"C:\INU3011\SaxonHE11-4J" -aoa"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
