IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Raccourcis EBSI"
ROBOCOPY "%~dp0Start Menu\Programs\Raccourcis EBSI" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Raccourcis EBSI" /mir

MKDIR "%ProgramFiles(x86)%\EBSI\Tuiles"
ROBOCOPY "%~dp0Program Files (x86)\EBSI\Tuiles" "%ProgramFiles(x86)%\EBSI\Tuiles" /mir

COPY "%~dp0LayoutModification.json" "%defaultUserFolder%\Appdata\Local\Microsoft\Windows\Shell" /Y
MKDIR "%defaultUserFolder%\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\"
COPY "%~dp0start.bin" "%defaultUserFolder%\AppData\Local\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\" /Y


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
