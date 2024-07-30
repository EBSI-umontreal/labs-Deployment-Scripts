IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0npp.8.6.9.Installer.x64.exe" /S


REM ## ADJUSTMENTS ##
cscript "%~dp0shortcut.vbs" "%defaultUserFolder%\AppData\Roaming\Microsoft\Windows\SendTo\Notepad++.lnk" "%ProgramFiles%\Notepad++\notepad++.exe"


REM ## STARTMENU ##


REM ******************** FILES ********************
REM Interface en francais
COPY "%ProgramFiles%\Notepad++\localization\french.xml" "%ProgramFiles%\Notepad++\nativeLang.xml" /Y
REM Enlever autoupdater
RMDIR "%ProgramFiles%\Notepad++\updater" /S /Q


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
