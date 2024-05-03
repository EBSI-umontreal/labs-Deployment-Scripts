IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
msiexec /qn /x "{2643823D-D15F-4046-8388-401756A5C921}"
msiexec /qn /x "{2643823D-D15F-4046-8388-401756A5C922}"
msiexec /qn /x "{2643823D-D15F-4046-8388-401756A5C923}"
msiexec /qn /x "{2643823D-D15F-4046-8388-401756A5C924}"



REM ## ADJUSTMENTS ##
REM DEL "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once\configAntidote.bat" /F /Q
REM DEL "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once\configAntidote.vbs" /F /Q
DEL "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once\Y_antidote-libreOffice.bat" /F /Q


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
