IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0Antidote11.msi" TRANSFORMS=ReseauAntidote.mst;Antidote11-Interface-fr.mst
START /WAIT msiexec.exe /qn /norestart /i "%~dp0Antidote-Connectix11.msi" TRANSFORMS=ReseauConnectix.mst;Antidote-Connectix11-Interface-fr.mst
START /WAIT msiexec.exe /qn /norestart /i "%~dp0Antidote11-Module-francais.msi" TRANSFORMS=Antidote11-Module-francais-Interface-fr.mst
REM START /WAIT msiexec.exe /qn /norestart /i "%~dp0Antidote11-English-module.msi" TRANSFORMS=Antidote11-English-module-Interface-fr.mst
REM START /WAIT msiexec.exe /qn /norestart /i "%~dp0AssistantTelechargement.msi"


REM ## ADJUSTMENTS ##
REM COPY "%~dp0GroupPolicy\User\Scripts\Logon\scripts\once\configAntidote.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once" /Y
REM COPY "%~dp0GroupPolicy\User\Scripts\Logon\scripts\once\configAntidote.vbs" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once" /Y
COPY "%~dp0GroupPolicy\User\Scripts\Logon\scripts\once\Y_antidote-libreOffice.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once" /Y


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
