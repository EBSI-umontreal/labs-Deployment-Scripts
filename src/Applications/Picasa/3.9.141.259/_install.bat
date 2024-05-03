IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0picasa39-setup.exe" /S /L


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
DEL  "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Picasa 3\D‚sinstaller.lnk" /F
DEL  "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Picasa 3\Configurer la visionneuse de photos Picasa.lnk" /F


REM ******************** FILES ********************
REM REGISTRE
COPY "%~dp0GPO_Logon\picasa.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once" /Y
COPY "%~dp0GPO_Logon\picasa.reg" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once" /Y


REM IMAGE (NE PAS LAISSER LE DOSSIER PICTURES VIDE)
COPY "%~dp0Default\Pictures\EBSI.jpg" "%defaultUserFolder%\Pictures" /Y


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
