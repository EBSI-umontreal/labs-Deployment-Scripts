IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0setup.exe" /S /v/qn


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\TextPad 7.6"
cscript "%~dp0shortcut.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\TextPad 7.6\TextPad.lnk" "%PROGRAMFILES%\TextPad 7\TextPad.exe"


REM ******************** FILES ********************
MKDIR "%PROGRAMDATA%\Helios\TextPad"
COPY "%~dp0Licence\TextPadKey.xml" "%PROGRAMDATA%\Helios\TextPad" /Y

MKDIR "%defaultUserFolder%\AppData\Roaming\Helios\TextPad\7"
COPY "%~dp0Roaming\Helios\TextPad\7\ConfigState.xml" "%defaultUserFolder%\AppData\Roaming\Helios\TextPad\7" /Y


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
