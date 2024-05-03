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
TAKEOWN /F "%SYSTEMROOT%\Web\Screen\img100.jpg"
icacls "%SYSTEMROOT%\Web\Screen\img100.jpg" /grant administrateurs:F
icacls "%SYSTEMROOT%\Web\Screen\img100.jpg" /grant %username%:F
REM COPY   "%SYSTEMROOT%\Web\Screen\img100.jpg" "%SYSTEMROOT%\Web\Screen\img100.jpg.bak"
COPY   "%~dp0img100.jpg" "%SYSTEMROOT%\Web\Screen" /Y

MKDIR "%ProgramFiles(x86)%\EBSI"
MKDIR "%ProgramFiles(x86)%\EBSI\lock-screen-image"
copy "%~dp0img100.jpg" "%ProgramFiles(x86)%\EBSI\lock-screen-image" /Y


REM **************** HKLM REGISTRY ****************
REM reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v LockScreenImage /d "%ProgramFiles(x86)%\EBSI\lock-screen-image\EBSI_lock-screen-image.png" /t REG_SZ /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v LockScreenImage /d "%ProgramFiles(x86)%\EBSI\lock-screen-image\img100.jpg" /t REG_SZ /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoChangingLockScreen /d 1 /t REG_SZ /f

REM Image not updating : https://social.technet.microsoft.com/Forums/office/en-US/d70ebe47-8681-4f21-813d-504b6cd071eb/group-policy-to-set-lock-screen-image-for-windows-10?forum=winserverGP
REM https://www.tenforums.com/customization/59696-lock-screen-background-image-does-not-appear-anniversary-update-5.html
REM reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SystemProtectedUserData\S-1-5-21-2046442738-783573707-16515117-1748\AnyoneRead\LockScreen" /va /f
REM https://community.spiceworks.com/topic/1262253-change-windows-10-lock-screen-background-image-gp?page=4
RMDIR "C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\LockScreen_Z" /S /Q


REM ************ DEFAULT USER REGISTRY ************
