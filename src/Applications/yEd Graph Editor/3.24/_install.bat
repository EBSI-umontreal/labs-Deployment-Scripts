IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
SET destinationFolder=%PROGRAMFILES%\yWorks\yEd
MKDIR "%destinationFolder%"
REM START /WAIT "" "%~dp07z.exe" x -y -x!".install4j" -x!"lib" -o"%destinationFolder%" "%~dp0yEd-3.23.2_without-JRE_64-bit_setup.exe"
START /WAIT "" "%~dp07z.exe" x -y  -o"%destinationFolder%" "%~dp0yEd-3.24.zip"


REM ## ADJUSTMENTS ##
MKLINK /J "%destinationFolder%\jre" "%PROGRAMFILES%\java\jre"


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\yEd Graph Editor"
cscript "%~dp0shortcut.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\yEd Graph Editor\yEd Graph Editor 3.24.lnk" "%PROGRAMFILES%\yWorks\yEd\yEd.exe"


REM ******************** FILES ********************
mkdir "%defaultUserFolder%\AppData\Roaming\yWorks\yEd"
ROBOCOPY "%~dp0Roaming\yWorks\yEd" "%defaultUserFolder%\AppData\Roaming\yWorks\yEd" *.* /E


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
