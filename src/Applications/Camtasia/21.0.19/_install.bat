IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0camtasia.msi" TRANSFORMS="%~dp0camtasia.mst"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG ADD "HKU\DefaultUser\Software\TechSmith\Camtasia Studio\21.0" /v "AnalyticsOptedIn" /t REG_DWORD /d 0 /f
REG ADD "HKU\DefaultUser\Software\TechSmith\Camtasia Studio\21.0\Camtasia Studio\21.0" /v "AllowDateBasedCheck" /t REG_DWORD /d 0 /f
REG ADD "HKU\DefaultUser\Software\TechSmith\Camtasia Studio\21.0\Camtasia Studio\21.0" /v "RunCount" /t REG_DWORD /d 1 /f

REM  MODIFICATIONS (fin)
reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
