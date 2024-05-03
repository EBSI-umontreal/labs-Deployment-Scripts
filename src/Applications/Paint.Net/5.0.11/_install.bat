IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0paint.net.5.0.11.winmsi.x64.msi"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
del "C:\Users\Public\Desktop\paint.net.lnk" /Q


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG ADD "HKU\DefaultUser\Software\paint.net" /v "CHECKFORUPDATES" /t REG_SZ /d "0" /f
REG ADD "HKU\DefaultUser\Software\paint.net" /v "UI/EnableAnimations" /t REG_SZ /d "False" /f
REG ADD "HKU\DefaultUser\Software\paint.net" /v "UI/Language" /t REG_SZ /d "fr" /f
REG ADD "HKU\DefaultUser\Software\paint.net" /v "Window/Main/FormWindowState" /t REG_SZ /d "Maximized" /f
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
