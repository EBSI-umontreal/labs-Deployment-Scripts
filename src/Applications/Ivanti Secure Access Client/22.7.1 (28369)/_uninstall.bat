IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /x "%~dp0Sources\PulseSecureInstallerService.msi"


REM ## ADJUSTMENTS ##
RMDIR "%programfiles(x86)%\EBSI\Ivanti" /S /Q

DEL "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once\PulseSecureAppLauncher.bat" /F


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
