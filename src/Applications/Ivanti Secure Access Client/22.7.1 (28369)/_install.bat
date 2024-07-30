IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /norestart /i "%~dp0Sources\PulseSecureInstallerService.msi" /quiet /qn PSAL_SMS_PUSH=1


REM ## ADJUSTMENTS ##
MKDIR "%programfiles(x86)%\EBSI\Ivanti"
COPY "%~dp0Sources\PulseSecureAppLauncher.msi" "%programfiles(x86)%\EBSI\Ivanti" /Y
COPY "%~dp0GroupPolicy\User\Scripts\Logon\scripts\once\PulseSecureAppLauncher.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once"


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
