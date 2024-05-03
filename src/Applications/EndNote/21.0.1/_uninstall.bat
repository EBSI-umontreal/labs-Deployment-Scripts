IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /x "%~dp0ENX9Inst.msi"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
RMDIR "%ProgramFiles(x86)%\EndNote 20\" /S /Q


RMDIR "%defaultUserFolder%\AppData\Roaming\EndNote" /S /Q





REM **************** HKLM REGISTRY ****************



REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG DELETE "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote" /F























REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
