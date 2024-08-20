IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%ProgramFiles(x86)%\EBSI"
MKDIR "%ProgramFiles(x86)%\EBSI\displayDuplicate"
COPY "%~dp0Program Files (x86)\EBSI\displayDuplicate\displayDuplicate.bat" "%ProgramFiles(x86)%\EBSI\displayDuplicate" /Y
COPY "%~dp0Program Files (x86)\EBSI\displayDuplicate\displayDuplicate.xml" "%ProgramFiles(x86)%\EBSI\displayDuplicate" /Y

COPY "%~dp0GroupPolicy\User\Scripts\Logon\scripts\displayDuplicate_run.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts" /Y
COPY "%~dp0GroupPolicy\User\Scripts\Logon\scripts\once\displayDuplicate_createTask.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once" /Y


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
