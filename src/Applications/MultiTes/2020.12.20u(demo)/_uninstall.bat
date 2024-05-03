IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "C:\mtPro\unins000.exe" /VERYSILENT /SUPPRESSMSGBOXES  /NORESTART
RMDIR "C:\mtPro" /S /Q


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\MultiTes 2020.20.12(demo)" /S /Q




REM ******************** FILES ********************
REM Reset du dossier au redémarrage du poste
RMDIR "%PROGRAMFILES(X86)%\EBSI\mtPro" /S /Q


DEL "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Startup\scripts\DossiermtPro.bat" /Q
DEL "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Startup\scripts\DossiermtPro.wsf" /Q



REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
