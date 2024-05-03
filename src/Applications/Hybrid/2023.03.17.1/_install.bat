IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
REM START /WAIT "" "%~dp0Hybrid_2021.07.18.1_SETUP.exe" /ALLUSERS /VERYSILENT
MKDIR "%ProgramFiles%\Hybrid"
START /WAIT "" "%~dp07z.exe" x "%~dp0Hybrid.2023.03.17.1.7z" -o"%ProgramFiles%" -aoa


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
REM DEL "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Hybrid\D?sinstaller Hybrid.lnk" /F
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Hybrid"
cscript "%~dp0shortcut-v2.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Hybrid\Hybrid 2023.03.17.1.lnk" "%ProgramFiles%\Hybrid\Hybrid.exe"




REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
