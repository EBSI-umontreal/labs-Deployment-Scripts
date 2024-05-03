IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************
REG DELETE "HKU\.DEFAULT\Keyboard Layout" /f
REG DELETE "HKU\.DEFAULT\Software\Microsoft\CTF" /f
REG DELETE "HKU\.DEFAULT\Control Panel\International" /f

REG IMPORT "%~dp0HKU_Lang.reg"
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "IgnoreRemoteKeyboardLayout" /t REG_DWORD /d 1 /f


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG DELETE "HKU\DefaultUser\Keyboard Layout" /f
REG DELETE "HKU\DefaultUser\Software\Microsoft\CTF" /f
REG DELETE "HKU\DefaultUser\Control Panel\International\User Profile" /f

REG IMPORT "%~dp0HKCU_Lang.reg"

REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"
