IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /x "%~dp0DGTIC\Build\Dreamweaver CS6.msi"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe Dreamweaver CS6" /S /Q





REM ******************** FILES ********************
RMDIR "%ProgramFiles(x86)%\Adobe\Adobe Dreamweaver CS6\" /S /Q


REM paramètres application
RMDIR "%defaultUserFolder%\AppData\Roaming\Adobe\Dreamweaver CS6" /S /Q


REM désactiver les MàJ
RMDIR "%defaultUserFolder%\AppData\Local\Adobe\AAMUpdater\1.0" /S /Q



REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG DELETE "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6" /f
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"
