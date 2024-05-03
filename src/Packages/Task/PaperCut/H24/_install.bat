IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
for %%i in (%~dp0\*.cer) do certutil -addstore -f "TrustedPublisher" %%i
cscript "%WINDIR%\system32\Printing_Admin_Scripts\fr-FR\prndrvr.vbs" -a -m "PaperCut Global PostScript" -i "%~dp0PC-Global-Print-Driver\PCGlobal.inf"
cscript "%~dp0AddLprPrinter.vbs"


REM ## ADJUSTMENTS ##
MKDIR "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once"
COPY "%~dp0LocalGPO\Logon\scripts\once\imp-noir-default.bat" "%WINDIR%\System32\GroupPolicy\User\Scripts\Logon\scripts\once" /Y


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
reg import "%~dp0PaperCutDEFAULT-SCRIPT.reg"
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enabled" /t REG_DWORD /d 0 /f
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"
