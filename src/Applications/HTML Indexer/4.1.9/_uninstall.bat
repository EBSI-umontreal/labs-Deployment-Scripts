IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /x{76960253-4263-11D6-B71F-00D0B71C7F69}


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%ProgramData%\Microsoft\Windows\Start Menu\Programs\HTML Indexer 4.1.9" /S /Q


REM ******************** FILES ********************
DEL "%WINDIR%\Indexer.INI" /Q



REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG DELETE HKU\DefaultUser\Software\Brown Inc.\" /F
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
