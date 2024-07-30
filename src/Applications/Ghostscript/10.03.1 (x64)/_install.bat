IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
REM SOURCE : https://stackoverflow.com/questions/76221444/installing-ghostscript-silently
SET VERSION=10.03.1
SET destinationFolder=%PROGRAMFILES%\gs\%VERSION%
MKDIR "%destinationFolder%"

START /WAIT "" "%~dp07z.exe" x -y -x!"$PLUGINSDIR" -x!"*.nsis" -x!"vcredist*" -o"%destinationFolder%" "%~dp0gs10031w64.exe"
START /WAIT "" "%~dp07z.exe" x -y -ir!"Identity-UTF16-H" -o"%destinationFolder% "%~dp0gs10031w64.exe"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************
reg.exe ADD "HKLM\SOFTWARE\Artifex\GPL Ghostscript\%VERSION%" /ve /d "%destinationFolder%" /f 
reg.exe ADD "HKLM\SOFTWARE\GPL Ghostscript\%VERSION%" /v "GS_DLL" /t REG_SZ /d "%destinationFolder%\bin\gsdll64.dll" /f 
reg.exe ADD "HKLM\SOFTWARE\GPL Ghostscript\%VERSION%" /v "GS_LIB" /t REG_SZ /d "%destinationFolder%\bin;%destinationFolder%\lib;%destinationFolder%\fonts" /f

START /WAIT "" powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp0PATH-variable_v2.ps1" add "%destinationFolder%"


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
