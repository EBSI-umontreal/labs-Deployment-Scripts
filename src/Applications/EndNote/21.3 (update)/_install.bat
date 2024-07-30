IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /p "%~dp0EN21Update.msp" /norestart USERCANAPPLYUPDATES=F


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##



REM ******************** FILES ********************



MKDIR "%defaultUserFolder%\AppData\Roaming\EndNote"
COPY "%~dp0Roaming\EndNote\connection cache.21" "%defaultUserFolder%\AppData\Roaming\EndNote" /Y
COPY "%~dp0Roaming\EndNote\filter cache.21 "%defaultUserFolder%\AppData\Roaming\EndNote" /Y
COPY "%~dp0Roaming\EndNote\style cache.21" "%defaultUserFolder%\AppData\Roaming\EndNote" /Y


REM **************** HKLM REGISTRY ****************
REG ADD "HKLM\SOFTWARE\Wow6432Node\ISI ResearchSoft\EndNote\21" /v USERCANAPPLYUPDATES /t REG_SZ /d F /f


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\IgnoreVersions" /V "21.0.0.0g" /T "REG_DWORD" /D 1 /F
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
