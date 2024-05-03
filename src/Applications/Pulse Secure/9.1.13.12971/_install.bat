IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /norestart /i "%~dp0PulseSecureInstallerService.msi" /quiet /qn
MKDIR "%programfiles(x86)%\EBSI\PulseSecure"
COPY "%~dp0PulseSecureAppLauncher.msi" "%programfiles(x86)%\EBSI\PulseSecure" /Y
COPY "%~dp0PulseSecureAppLauncher.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
