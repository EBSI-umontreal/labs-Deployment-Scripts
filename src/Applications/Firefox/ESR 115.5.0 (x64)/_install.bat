IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0Firefox Setup 115.5.0esr.exe" /INI="%~dp0install.ini"



REM ## ADJUSTMENTS ##
if exist "%programfiles%\Mozilla Firefox\" (
	MKDIR "%programfiles%\Mozilla Firefox\browser\defaults\pref"
	COPY "%~dp0override.ini" "%programfiles%\Mozilla Firefox\browser\"  /Y
	COPY "%~dp0autoconfig.js" "%programfiles%\Mozilla Firefox\defaults\pref\"  /Y
	COPY "%~dp0ebsi.cfg" "%programfiles%\Mozilla Firefox\"  /Y
	MKDIR "%programfiles%\Mozilla Firefox\distribution"
	COPY "%~dp0policies.json" "%programfiles%\Mozilla Firefox\distribution" /Y
	cscript "%~dp0shortcut.vbs" "%defaultUserFolder%\AppData\Roaming\Microsoft\Windows\SendTo\Mozilla Firefox.lnk" "%programfiles%\Mozilla Firefox\firefox.exe"
)
if exist "%programfiles(x86)%\Mozilla Firefox\" (
	MKDIR "%programfiles(x86)%\Mozilla Firefox\browser\defaults\pref"
	COPY "%~dp0override.ini" "%programfiles(x86)%\Mozilla Firefox\browser\"  /Y
	COPY "%~dp0autoconfig.js" "%programfiles(x86)%\Mozilla Firefox\defaults\pref\"  /Y
	COPY "%~dp0ebsi.cfg" "%programfiles(x86)%\Mozilla Firefox\"  /Y
	MKDIR "%programfiles(x86)%\Mozilla Firefox\distribution"
	COPY "%~dp0policies.json" "%programfiles(x86)%\Mozilla Firefox\distribution" /Y
	cscript "%~dp0shortcut.vbs" "%defaultUserFolder%\AppData\Roaming\Microsoft\Windows\SendTo\Mozilla Firefox.lnk" "%programfiles(x86)%\Mozilla Firefox\firefox.exe"
)


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
