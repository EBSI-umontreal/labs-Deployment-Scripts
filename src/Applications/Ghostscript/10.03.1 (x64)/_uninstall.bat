IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##

SET VERSION=10.03.1
SET destinationFolder=%PROGRAMFILES%\gs\%VERSION%
RMDIR "%destinationFolder%" /S /Q





REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************
reg.exe DELETE "HKLM\SOFTWARE\Artifex\GPL Ghostscript\%VERSION%" /f
reg.exe DELETE "HKLM\SOFTWARE\GPL Ghostscript\%VERSION%" /f


START /WAIT "" powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp0PATH-variable_v2.ps1" remove "%destinationFolder%"


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
