IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%WinDir%\NET35Install"
REM COPY "%~dp0Microsoft-Windows-NetFx3-OnDemand-Package~31bf3856ad364e35~amd64~fr-FR~.cab" "%WinDir%\NET35Install" /Y
COPY "%~dp0microsoft-windows-netfx3-ondemand-package~31bf3856ad364e35~amd64~~.cab" "%WinDir%\NET35Install" /Y
DISM.EXE /online /enable-feature /featurename:NetFx3 /All /Source:"%WinDir%\NET35Install" /LimitAccess


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
