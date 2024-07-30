IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0Zotero-6.0.36_setup.exe" /INI="%~dp0install.ini"



REM ## ADJUSTMENTS ##
if exist "%programfiles%\Zotero\" (
	MKDIR "%programfiles%\Zotero\defaults\pref"
	COPY "%~dp0autoconfig.js" "%programfiles%\Zotero\defaults\pref" /Y
	COPY "%~dp0ebsi.cfg" "%programfiles%\Zotero\"  /Y
)
if exist "%programfiles(x86)%\Zotero\" (
	MKDIR "%programfiles(x86)%\Zotero\defaults\pref"
	COPY "%~dp0autoconfig.js" "%programfiles(x86)%\Zotero\defaults\pref" /Y
	COPY "%~dp0ebsi.cfg" "%programfiles(x86)%\Zotero\"  /Y
)

MKDIR "%defaultUserFolder%\Zotero\styles"
XCOPY "%~dp0ADD_UdeM\*.*" "%defaultUserFolder%\Zotero\styles" /S /Y


REM ## STARTMENU ##



REM ******************** FILES ********************
COPY "%~dp0GroupPolicy\zotero-addin-LO.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\Once" /Y
COPY "%~dp0GroupPolicy\zotero-addin-Word.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\Once" /Y


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
