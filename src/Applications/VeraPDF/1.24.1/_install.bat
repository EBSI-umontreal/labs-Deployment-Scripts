IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
REM copie courante
MKDIR "%PROGRAMFILES(X86)%\veraPDF"
START /WAIT "" "%~dp07z.exe" x "%~dp0VeraPDF-1.24.1.zip" -o"%PROGRAMFILES(X86)%" -aoa
ICACLS "%PROGRAMFILES(X86)%\veraPDF" /grant .\Utilisateurs:(OI)(CI)F

REM copie restauration
MKDIR "%PROGRAMFILES(X86)%\EBSI\VeraPDF"
ROBOCOPY "%PROGRAMFILES(X86)%\veraPDF" "%PROGRAMFILES(X86)%\EBSI\VeraPDF" /mir

MKDIR "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Startup\scripts"
COPY "%~dp0GPO_startup\VeraPDF.bat" "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Startup\scripts" /Y


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\veraPDF"
cscript "%~dp0shortcut-v2.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\veraPDF\veraPDF GUI 1.24.1.lnk" "%PROGRAMFILES(X86)%\verapdf\verapdf-gui.bat"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
