IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
ROBOCOPY "%~dp0GroupPolicy\Machine\Scripts" *.* "%WINDIR%\System32\GroupPolicy\Machine\Scripts" /E
ROBOCOPY "%~dp0GroupPolicy\User\Scripts" *.* "%WINDIR%\System32\GroupPolicy\User\Scripts" /E


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
