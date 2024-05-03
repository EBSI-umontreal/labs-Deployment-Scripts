IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%ProgramFiles(x86)%\EBSI\DefaultAppAssociations"
COPY "%~dp0AppAssocW11_23H2.txt" "%ProgramFiles(x86)%\EBSI\DefaultAppAssociations"
DISM /online /Import-DefaultAppAssociations:"%ProgramFiles(x86)%\EBSI\DefaultAppAssociations\AppAssocW11_23H2.txt"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM **************** HKLM REGISTRY ****************
REM Désactiver Toast new application
REG ADD "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoNewAppAlert" /t REG_DWORD /d 1 /f


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)


REM Office - Désactiver vérification des app par défaut
REG ADD "HKU\DefaultUser\Software\Microsoft\Office\16.0\Excel\Options" /v "AlertIfNotDefault" /t REG_DWORD /d 0 /f
REG ADD "HKU\DefaultUser\Software\Microsoft\Office\16.0\PowerPoint\Options" /v "AlertIfNotDefault" /t REG_DWORD /d 0 /f
REG ADD "HKU\DefaultUser\Software\Microsoft\Office\16.0\Word\Options" /v "AlertIfNotDefault" /t REG_DWORD /d 0 /f
REM oneNote
REG ADD "HKU\DefaultUser\Software\Microsoft\Office\16.0\OneNote" /v "FirstBootStatus" /t REG_DWORD /d 16777473 /f
REG ADD "HKU\DefaultUser\Software\Microsoft\Office\16.0\OneNote\Options" /v "BootClippingPanelWithOneNote" /t REG_DWORD /d 0 /f


REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"
