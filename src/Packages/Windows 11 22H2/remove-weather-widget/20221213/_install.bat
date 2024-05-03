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


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REM EULA
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"
