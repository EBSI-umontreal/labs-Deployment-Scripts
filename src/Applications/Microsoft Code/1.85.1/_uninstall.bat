IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%ProgramFiles%\Microsoft VS Code\unins000.exe" /SILENT


REM ## ADJUSTMENTS ##
DEL "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once\configCode.bat" /F /Q
RMDIR "%PROGRAMFILES(X86)%\EBSI\Code" /S /Q



REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
