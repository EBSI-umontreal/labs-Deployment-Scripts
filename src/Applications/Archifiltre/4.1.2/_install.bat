IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0archifiltre-docs-win-x64.msi" ALLUSERS=1
START /WAIT msiexec.exe /qn /norestart /i "%~dp0archifiltre-mails-win.msi" ALLUSERS=1
taskkill /IM "Mails par Archifiltre.exe" /f


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Archifiltre"
MOVE /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Docs par Archifiltre.lnk" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Archifiltre"
MOVE /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Mails par Archifiltre.lnk" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Archifiltre"


REM ******************** FILES ********************
ping 127.0.0.1 -n 10 > nul
del "%PUBLIC%\Desktop\Docs par Archifiltre.lnk" /F
del "%PUBLIC%\Desktop\Mails par Archifiltre.lnk" /F


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
