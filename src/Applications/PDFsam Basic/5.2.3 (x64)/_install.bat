IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0pdfsam-5.2.3.msi" CHECK_FOR_UPDATES=false DONATE_NOTIFICATION=false SKIPTHANKSPAGE=Yes


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RENAME "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\PDFsam Basic" "PDFsam Basic 5.2.3"
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\PDFsam Basic 5.2.3\PDFsam on the Web.url" /F
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\PDFsam Basic 5.2.3\Uninstall.lnk" /F


REM ******************** FILES ********************
ping 127.0.0.1 -n 10 > nul
del "%PUBLIC%\Desktop\PDFsam Basic.lnk" /F


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
reg import "%~dp0PDFsamDEFAULT.reg"
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
