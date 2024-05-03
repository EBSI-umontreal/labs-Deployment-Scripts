IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0VSCodeSetup-x64-1.85.1.exe" /VERYSILENT /MERGETASKS=!runcode


REM ## ADJUSTMENTS ##
COPY "%~dp0GroupPolicy\User\Scripts\Logon\scripts\once\configCode.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once" /Y
MKDIR "%PROGRAMFILES(X86)%\EBSI\Code"
COPY "%~dp0vscode-language-pack-fr-1.85.2023121309_vsixhub.com.vsix" "%PROGRAMFILES(X86)%\EBSI\Code" /Y


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
