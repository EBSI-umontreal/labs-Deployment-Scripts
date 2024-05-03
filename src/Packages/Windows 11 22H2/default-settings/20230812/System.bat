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
XCOPY "%~dp0Desktop\*" "%defaultUserFolder%\Desktop" /Y /S


REM **************** HKLM REGISTRY ****************

rem Make sure time and date are correct
w32tm /resync /rediscover

rem Disable Error Reporting
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f

rem Disable automatic TCG/Opal disk locking on supported SSD drives with PSID
reg add HKLM\Software\Policies\Microsoft\Windows\EnhancedStorageDevices /v TCGSecurityActivationDisabled /t REG_DWORD /d 1 /f

rem Control Panel shows Large Icons
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v ForceClassicControlPanel /t REG_DWORD /d 1 /f

rem Disable discovery of LAN devices like printers
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private /v AutoSetup /t REG_DWORD /d 0 /f

rem Disable Warnings due to Firewall / Defender being disabled
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance /v Enabled /t REG_DWORD /d 0 /f
REM reg add "HKLM\Software\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f

rem Workaround for bug that shows Firewall "application blocked" messages, despite Firewall being disabled for private network
netsh firewall set notifications mode=disable profile=standard

rem Disable "Consumer Features" (aka downloading apps from the internet automatically)
reg add HKLM\Software\Policies\Microsoft\Windows\CloudContent /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f

rem Remove Meet Now icon
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v HideSCAMeetNow /t REG_DWORD /d 1 /f

rem Disable One Drive
reg add HKLM\Software\Policies\Microsoft\Windows\OneDrive /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f
start /wait %SystemRoot%\System32\OneDriveSetup.exe /uninstall
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S
reg delete "HKEY_USERS\S-1-5-19\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f
reg delete "HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f
reg load HKLM\DEFAULT c:\users\default\ntuser.dat
reg delete HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run /v OneDriveSetup /f
reg unload HKLM\DEFAULT

rem Disable System Restore and delete restore points
powershell disable-computerrestore c:
vssadmin delete shadows /all /quiet

rem Disable reboot on Bluescreen, and no dump
reg add HKLM\SYSTEM\CurrentControlSet\Control\CrashControl /v CrashDumpEnabled /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\CrashControl /v LogEvent /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\CrashControl /v SendAlert /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\CrashControl /v AutoReboot /t REG_DWORD /d 0 /f

rem Don't allow Remote Assistance
reg add "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 0 /f

rem Disable Edge Browser preload on startup. We'll never use it anyway, saves memory and startup time
reg add HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main /v AllowPrelaunch /t REG_DWORD /d 0 /f
reg add HKLM\Software\Policies\Microsoft\Edge /v StartupBoostEnabled /t REG_DWORD /d 0 /f

rem Disable Edge Browser (Chromium) first run experience
reg add HKLM\Software\Policies\Microsoft\Edge /v HideFirstRunExperience /t REG_DWORD /d 1 /f

rem Block Edge from recreating the desktop icon on every update
reg add HKLM\Software\Policies\Microsoft\EdgeUpdate /v CreateDesktopShortcutDefault /t REG_DWORD /d 0 /f
reg add HKLM\Software\Policies\Microsoft\EdgeUpdate /v RemoveDesktopShortcutDefault /t REG_DWORD /d 1 /f

rem Disable Look for App in Store prompt when opening unknown file type
reg add HKLM\Software\Policies\Microsoft\Windows\Explorer /v NoUseStoreOpenWith /t REG_DWORD /d 1 /f

rem Disable Windows Program Compatibility Assistant
reg add HKLM\Software\Policies\Microsoft\Windows\AppCompat /v DisablePCA /t REG_DWORD /d 1 /f

rem Disable Inventory collecting data and sending the info to Microsoft
reg add HKLM\Software\Policies\Microsoft\Windows\AppCompat /v DisableInventory /t REG_DWORD /d 1 /f

rem Disable Application Telemetry
reg add HKLM\Software\Policies\Microsoft\Windows\AppCompat /v AITEnable /t REG_DWORD /d 0 /f

rem Disable Shared Experiences
reg add HKLM\Software\Policies\Microsoft\Windows\System /v EnableCdp /t REG_DWORD /d 0 /f

rem Remove "Chat" from Taskbar and block automatic Teams installation
rem We need to take ownership of the key first
REM PowerShell "(New-Object System.Net.WebClient).DownloadFile('https://www.techpowerup.com/wizzard/SetACL.exe', '%TEMP%\SetACL.exe');
REM %TEMP%\SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications" -ot reg -actn setowner -ownr "n:Everyone"
REM %TEMP%\SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications" -ot reg -actn ace -ace "n:Everyone;p:full"
REM del %TEMP%\SetACL.exe

reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Chat" /f /v ChatIcon /t REG_DWORD /d 3
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Communications /v ConfigureChatAutoInstall /t REG_DWORD /d 0 /f
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /f /v TaskbarMn /t REG_DWORD /d 0

rem Remove useless optional features
dism /online /norestart /Remove-Capability /CapabilityName:App.Support.QuickAssist~~~~0.0.1.0
dism /online /norestart /Remove-Capability /CapabilityName:Hello.Face.20134~~~~0.0.1.0
dism /online /norestart /Remove-Capability /CapabilityName:Microsoft.Wallpapers.Extended~~~~0.0.1.0


REM ===============
REM =     EBSI    =
REM ===============
rem Remove Chat button
reg add HKLM\Software\Policies\Microsoft\Windows /v ChatIcon /t REG_DWORD /d 3 /f


REM ************ DEFAULT USER REGISTRY ************
