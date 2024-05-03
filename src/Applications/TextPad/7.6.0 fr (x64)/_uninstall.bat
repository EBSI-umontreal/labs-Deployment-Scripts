IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /x {3DE3E4EE-F270-4A31-AB76-475515C661BD}


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\TextPad 7.6" /S /Q



REM ******************** FILES ********************
RMDIR "%PROGRAMDATA%\Helios\TextPad" /S /Q


RMDIR "%defaultUserFolder%\AppData\Roaming\Helios\TextPad\7" /S /Q



REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
