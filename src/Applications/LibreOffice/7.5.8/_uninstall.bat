IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /x "%~dp0LibreOffice_7.5.8_Win_x86-64.msi"
START /WAIT msiexec.exe /qn /norestart /x "%~dp0LibreOffice_7.5.8_Win_x86-64_helppack_fr.msi"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************




REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
