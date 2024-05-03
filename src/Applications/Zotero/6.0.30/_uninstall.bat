IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
if exist "%programfiles%\Zotero\uninstall\helper.exe" START /WAIT "" "%programfiles%\Zotero\uninstall\helper.exe" -ms
if exist "%ProgramFiles(x86)%\Zotero\uninstall\helper.exe" START /WAIT "" "%ProgramFiles(x86)%\Zotero\uninstall\helper.exe" -ms


REM ## ADJUSTMENTS ##
if exist "%programfiles%\Zotero\" RMDIR "%programfiles%\Zotero\" /S /Q
if exist "%ProgramFiles(x86)%\Zotero\" RMDIR "%ProgramFiles(x86)%\Zotero\" /S /Q










REM ## STARTMENU ##
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Zotero.lnk" /Q


REM ******************** FILES ********************
DEL "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\Once\zotero-addin-Word.bat" /Q


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
