IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0AcroRead.msi" TRANSFORMS="AcroRead.mst" PATCH="%~dp0AcroRdrDCUpd2400220857.msp"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
ping 127.0.0.1 -n 10 > nul
del "%PUBLIC%\Desktop\Acrobat Reader�DC.lnk" /F


REM **************** HKLM REGISTRY ****************
reg import "%~dp0reader-policies.reg"


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (d�but)
REM EULA
REG ADD "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\AdobeViewer" /v "EULA" /t REG_DWORD /d 1 /f

REM FIRST RUN
REG ADD "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\AVGeneral" /v "bisFirstLaunch" /t REG_DWORD /d 0 /f
REG ADD "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\AVGeneral" /v "bHideUnreadMsgAtLaunch" /t REG_DWORD /d 1 /f

REM Plein �cran
REG ADD "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\SDI" /v "bMaximizeNextDocument" /t REG_DWORD /d 1 /f
REG ADD "HKU\DefaultUser\Software\Adobe\Acrobat Reader\DC\SDI" /v "bNullDocMaximized" /t REG_DWORD /d 1 /f
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
