IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
copy "%~dp0EBSI-W11.theme" "%SystemRoot%\Resources\Themes" /Y
copy "%~dp0localGPO\theme.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts" /Y
copy "%~dp0localGPO\ThemeSwitcher.exe" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts" /Y


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************
REM REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes" /v "InstallTheme" /t REG_SZ /d "%%systemroot%%\Resources\Themes\EBSI-W11.theme" /f
REM REG ADD "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Themes" /v "InstallTheme" /t REG_SZ /d "%%systemroot%%\Resources\Themes\EBSI-W11.theme" /f


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REM reg add "HKU\DefaultUser\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "Themefile" /t REG_SZ /d "%%systemroot%%\Resources\Themes\EBSI-W11.theme" /f
REM https://social.technet.microsoft.com/Forums/windows/en-US/43d06ffc-8ff8-4e29-83d1-d849136e7245/how-to-change-the-theme-in-the-default-profile-so-new-users-get-a-different-theme?forum=w7itproinstall
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme"    /t REG_DWORD /d 1 /f
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 1 /f
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence"      /t REG_DWORD /d 0 /f
REG ADD "HKU\DefaultUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency"   /t REG_DWORD /d 1 /f
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"
