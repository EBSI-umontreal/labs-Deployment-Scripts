IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
MKDIR "%PROGRAMFILES(X86)%\DROID"
START /WAIT "" "%~dp07z.exe" x "%~dp0droid-binary-6.7.0-bin-win32-with-jre.zip" -o"%PROGRAMFILES(X86)%\DROID" -aoa"


REM ## ADJUSTMENTS ##
REM COPY "%~dp0EBSI\droid.bat" "%PROGRAMFILES(X86)%\DROID" /Y


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\DROID"
cscript "%~dp0shortcut-v2.vbs" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\DROID\DROID 6.7.0.lnk" "%ProgramFiles(x86)%\DROID\droid.bat"


REM ******************** FILES ********************
MKDIR "%defaultUserFolder%\.droid6"
ROBOCOPY "%~dp0default\.droid6" "%defaultUserFolder%\.droid6" /MIR


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
