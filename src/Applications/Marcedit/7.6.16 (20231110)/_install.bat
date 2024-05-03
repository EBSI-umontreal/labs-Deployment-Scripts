IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0windowsdesktop-runtime-6.0.25-win-x86.exe" /install /quiet /norestart
START /WAIT "" "%~dp0windowsdesktop-runtime-6.0.25-win-x64.exe" /install /quiet /norestart
START /WAIT "" "%~dp0MicrosoftEdgeWebView2RuntimeInstallerX64.exe" /silent /install
START /WAIT "" "%~dp0MarcEdit_7_6_mixed.exe" /exenoui /exenoupdates /q


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM Icone bureau
del "%PUBLIC%\Desktop\MarcEdit 7.6.lnk" /F


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
