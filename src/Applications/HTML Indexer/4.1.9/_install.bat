IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0HTML_Indexer_419.exe" /S /v"ALLUSERS=2 /qn"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RENAME "%ProgramData%\Microsoft\Windows\Start Menu\Programs\HTML Indexer" "HTML Indexer 4.1.9"


REM ******************** FILES ********************
COPY "%~dp0Indexer.INI" "%WINDIR%" /Y
ICACLS "%WINDIR%\Indexer.INI" /grant .\Utilisateurs:F


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG ADD "HKU\DefaultUser\Software\Brown Inc.\HTML Indexer\Version 40" /v "Product Code" /t REG_SZ /d "HI40-050001-2966" /f
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
