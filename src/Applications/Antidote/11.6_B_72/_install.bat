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
START /WAIT msiexec.exe /qn /norestart /i "%~dp0Antidote11-English-module.msi" TRANSFORMS=Antidote11-English-module-Interface-fr.mst
REM START /WAIT msiexec.exe /qn /norestart /i "%~dp0AssistantTelechargement.msi"


REM ## ADJUSTMENTS ##
COPY "%~dp0GroupPolicy\User\Scripts\Logon\scripts\once\Y_antidote-libreOffice.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once" /Y


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG ADD "HKU\DefaultUser\Software\Druide informatique inc.\Antidote\11.0\InstallationSilencieuse" /v "OnDoitEtreSilencieux_Date_SynchroHKLM" /t REG_SZ /d "2024-03-14 00:00:00" /f
REG ADD "HKU\DefaultUser\Software\Druide informatique inc.\Antidote\11.0\Adaptateurs2\preferences" /v "afficherNouveautes" /t REG_SZ /d "false" /f
REG ADD "HKU\DefaultUser\Software\Druide informatique inc.\Antidote\11.0\Adaptateurs2\preferences" /v "afficherNouveautesA11" /t REG_SZ /d "false" /f
REG ADD "HKU\DefaultUser\Software\Druide informatique inc.\Antidote\11.0\Adaptateurs2\preferences" /v "afficherPriseEnMainA11" /t REG_SZ /d "false" /f

REM  MODIFICATIONS (fin)
reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
