IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
del "%ProgramFiles%\Oxygen XML Editor 26\2024042206.txt"
START /WAIT "" "%ProgramFiles%\Oxygen XML Editor 26\uninstall.exe" -q


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##







REM ## SENDTO ##
DEL "%defaultUserFolder%\AppData\Roaming\Microsoft\Windows\SendTo\Oxygen XML Editor.lnk" /Q


REM ******************** FILES ********************
RMDIR "%defaultUserFolder%\AppData\Roaming\com.oxygenxml" /S /Q



REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
