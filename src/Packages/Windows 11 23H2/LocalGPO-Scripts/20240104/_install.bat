IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%ProgramFiles(x86)%\EBSI"
MKDIR "%ProgramFiles(x86)%\EBSI\CURL"
ROBOCOPY "%~dp0Program Files (x86)\EBSI\CURL" "%ProgramFiles(x86)%\EBSI\CURL" /MIR
MKDIR "%ProgramFiles(x86)%\EBSI\DWCS55&6"
ROBOCOPY "%~dp0Program Files (x86)\EBSI\DWCS55&6" "%ProgramFiles(x86)%\EBSI\DWCS55&6" /MIR
MKDIR "%ProgramFiles(x86)%\EBSI\Favoris"
ROBOCOPY "%~dp0Program Files (x86)\EBSI\Favoris" "%ProgramFiles(x86)%\EBSI\Favoris" /MIR


MKDIR "%ProgramFiles(x86)%\EBSI\volume"
ROBOCOPY "%~dp0Program Files (x86)\EBSI\volume" "%ProgramFiles(x86)%\EBSI\volume" /MIR

ROBOCOPY "%~dp0GroupPolicy\Machine\Scripts\Shutdown\scripts" "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Shutdown\scripts" /MIR
ROBOCOPY "%~dp0GroupPolicy\Machine\Scripts\Startup\scripts" "%WINDIR%\System32\GroupPolicy\Machine\Scripts\Startup\scripts" /MIR

ROBOCOPY "%~dp0GroupPolicy\User\Scripts\Logon\scripts" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts" /MIR
ROBOCOPY "%~dp0GroupPolicy\User\Scripts\Logoff\scripts" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logoff\scripts" /MIR


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
