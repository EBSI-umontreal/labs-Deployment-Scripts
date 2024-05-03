IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0ADE_4.5_Installer.exe" /S


REM ## ADJUSTMENTS ##
COPY "%~dp0adeupdaterconfig.cfg" "%PROGRAMFILES(X86)%\Adobe\Adobe Digital Editions 4.5" /Y


REM ## STARTMENU ##
MOVE  "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe\Adobe Digital Editions 4.5" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs"
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe" /S /Q
DEL   "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe Digital Editions 4.5\Uninstall.lnk" /F
DEL   "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe Digital Editions 4.5.lnk" /F
DEL   "%PUBLIC%\Desktop\Adobe Digital Editions 4.5.lnk" /F


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG ADD "HKU\DefaultUser\Software\Adobe\Adobe Digital Editions 4.5" /v "ConfigPath"       /t REG_SZ /d "C:\Program Files (x86)\Adobe\Adobe Digital Editions 4.5\adeupdaterconfig.cfg" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Adobe Digital Editions 4.5" /v "EnableAutoUpdate" /t REG_SZ /d 0 /f
REG ADD "HKU\DefaultUser\Software\Adobe\Adobe Digital Editions 4.5" /v "ReaderState"      /t REG_SZ /d 0 /f
REG ADD "HKU\DefaultUser\Software\Adobe\Adobe Digital Editions 4.5" /v "UpdateInterval"   /t REG_SZ /d 0 /f
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
