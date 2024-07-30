IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp07z.exe" x "%~dp0openrefine-win-with-java-3.8.2.zip" -o"%ProgramFiles%" -aoa
:LOOP
TIMEOUT 5
RENAME "%ProgramFiles%\openrefine-3.8.2" "OpenRefine"
IF NOT EXIST "%ProgramFiles%\OpenRefine" GOTO LOOP
:SUITE
type nul > "%ProgramFiles%\OpenRefine\openrefine-win-3.8.2.txt"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\OpenRefine"
cscript "%~dp0shortcut-v2.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\OpenRefine\OpenRefine 3.8.2.lnk" "%ProgramFiles%\OpenRefine\openrefine.exe"


REM ## SENDTO ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
