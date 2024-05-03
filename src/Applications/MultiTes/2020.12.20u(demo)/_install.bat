IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0Setup-MultiTesPro-Trial.exe" /VERYSILENT /NORESTART /LOADINF="%~dp0multites.inf"



REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\MultiTes 2020.20.12(demo)\Uninstall MultiTes Pro.lnk" /Q
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\MultiTes Pro TRIAL.lnk" /Q
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\MultiTes 2020.20.12(demo)\MultiTes Pro TRIAL" /S /Q


REM ******************** FILES ********************
REM Reset du dossier au redémarrage du poste
MKDIR "%PROGRAMFILES(X86)%\EBSI\mtPro"
ROBOCOPY "C:\mtPro" "%PROGRAMFILES(X86)%\EBSI\mtPro" /mir
MKDIR "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Startup\scripts"
COPY "%~dp0GPO_startup\DossiermtPro.bat" "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Startup\scripts" /Y
COPY "%~dp0GPO_startup\DossiermtPro.wsf" "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Startup\scripts" /Y
COPY "%~dp0GPO_startup\DroitsNTFS.inc" "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Startup\scripts" /Y


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
