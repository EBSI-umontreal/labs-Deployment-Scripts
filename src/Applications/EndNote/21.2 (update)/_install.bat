IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /p "%~dp0EN212Update.msp" /norestart USERCANAPPLYUPDATES=F


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##



REM ******************** FILES ********************



MKDIR "%defaultUserFolder%\AppData\Roaming\EndNote"
COPY "%~dp0Roaming\EndNote\connection cache.21" "%defaultUserFolder%\AppData\Roaming\EndNote" /Y
COPY "%~dp0Roaming\EndNote\filter cache.21 "%defaultUserFolder%\AppData\Roaming\EndNote" /Y
COPY "%~dp0Roaming\EndNote\style cache.21" "%defaultUserFolder%\AppData\Roaming\EndNote" /Y


REM **************** HKLM REGISTRY ****************
REG ADD "HKLM\SOFTWARE\Wow6432Node\ISI ResearchSoft\EndNote\20" /v USERCANAPPLYUPDATES /t REG_SZ /d F /f


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
