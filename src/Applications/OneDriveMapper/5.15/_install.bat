IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%ProgramFiles(x86)%\OneDriveMapper"
ROBOCOPY "%~dp0OneDriveMapper" "%ProgramFiles(x86)%\OneDriveMapper" /mir


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
COPY "%~dp0Desktop\Lecteur O - OneDrive UdeM.lnk" "%defaultUserFolder%\Desktop" /Y


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************
REM Modifier la taille limite des fichiers transmis en WebDAV (de 50Mo à 4Go)
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WebClient\Parameters" /v "FileSizeLimitInBytes" /t REG_DWORD /d 0xffffffff /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WebClient\Parameters" /v "FsCtlRequestTimeoutInSec" /t REG_DWORD /d 0xffffffff /f
REM Désactiver le File Locking
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WebClient\Parameters" /v "SupportLocking" /t REG_DWORD /d 0 /f
net stop WEBCLIENT
net start WEBCLIENT


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
