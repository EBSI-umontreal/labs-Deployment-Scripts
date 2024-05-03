IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0OpenJDK17U-jdk_x86-32_windows_hotspot_17.0.9_9.msi"  INSTALLDIR="%ProgramFiles(x86)%\Java\jre" INSTALLLEVEL=2 /quiet
START /WAIT msiexec.exe /qn /norestart /i "%~dp0OpenJDK17U-jdk_x64_windows_hotspot_17.0.9_9.msi"     INSTALLDIR="%ProgramFiles%\Java\jre"      INSTALLLEVEL=2 /quiet


REM ## ADJUSTMENTS ##
setx /M JAVA_HOME "C:\Program Files\Java\jre"


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
