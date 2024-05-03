IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
if exist "%programfiles%\Mozilla Firefox\uninstall\helper.exe" START /WAIT "" "%programfiles%\Mozilla Firefox\uninstall\helper.exe" -ms
if exist "%ProgramFiles(x86)%\Mozilla Firefox\uninstall\helper.exe" START /WAIT "" "%ProgramFiles(x86)%\Mozilla Firefox\uninstall\helper.exe" -ms


REM ## ADJUSTMENTS ##
if exist "%programfiles%\Mozilla Firefox\" RMDIR "%programfiles%\Mozilla Firefox\" /S /Q
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" RMDIR "%ProgramFiles(x86)%\Mozilla Firefox\" /S /Q
DEL "%defaultUserFolder%\AppData\Roaming\Microsoft\Windows\SendTo\Mozilla Firefox.lnk" /Q

















REM ## STARTMENU ##
del "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Firefox.lnk" /F

REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
