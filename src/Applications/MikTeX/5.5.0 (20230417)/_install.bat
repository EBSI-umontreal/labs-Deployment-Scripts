IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp07z.exe" x "%~dp0Packages.zip" -o"%SystemRoot%\Temp" -aoa
START /WAIT "" "%~dp0miktexsetup_standalone.exe" --quiet --local-package-repository="%SystemRoot%\Temp\Packages" --package-set=complete install
RMDIR /S /Q "%SystemRoot%\Temp\Packages"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
