IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0oxygen-64bit-openjdk.exe"  -q -overwrite -varfile "%~dp0response.varfile"
type nul > "%ProgramFiles%\Oxygen XML Editor 26\2023111306.txt"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
del "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Oxygen XML Editor 26.0 (64-bit)\Oxygen XML Editor d?sinstallateur.lnk" /Q
rem #Bureau
del "C:\Users\Public\Desktop\Oxygen XML Author 26.0.lnk"  /Q
del "C:\Users\Public\Desktop\Oxygen XML Developer 26.0.lnk"  /Q
del "C:\Users\Public\Desktop\Oxygen XML Editor 26.0.lnk"  /Q


REM ## SENDTO ##
cscript "%~dp0shortcut.vbs" "%defaultUserFolder%\AppData\Roaming\Microsoft\Windows\SendTo\Oxygen XML Editor.lnk" "%ProgramFiles%\Oxygen XML Editor 26\oxygen26.0.exe"


REM ******************** FILES ********************
mkdir "%defaultUserFolder%\AppData\Roaming\com.oxygenxml"
ROBOCOPY "%~dp0com.oxygenxml" "%defaultUserFolder%\AppData\Roaming\com.oxygenxml" /mir


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
