IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%ProgramFiles%\Google\Chrome\Application\"
START /WAIT msiexec.exe /qn /norestart /i "%~dp0GoogleChromeStandaloneEnterprise64.msi"


REM ## ADJUSTMENTS ##
XCOPY "%~dp0initial_preferences" "%ProgramFiles%\Google\Chrome\Application\" /E /C /Q /R /Y


REM ## STARTMENU ##
ping 127.0.0.1 -n 10 > nul
del "%PUBLIC%\Desktop\Google Chrome.lnk" /F


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************
REM sc stop gupdate
REM sc config gupdate start= disabled
REM reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Update" /v UpdateDefault /t REG_DWORD /d 0 /f
REM reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Update" /v DisableAutoUpdateChecksCheckboxValue /t REG_DWORD /d 1 /f
REM reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Update" /v AutoUpdateCheckPeriodMinutes /t REG_DWORD /d 0 /f


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
