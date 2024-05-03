IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp07z2301-x64.exe" /S


REM ## ADJUSTMENTS ##
REM Associations
assoc .7z=7-Zip.7z
assoc .bz2=7-Zip.bz2
assoc .gz=7-Zip.gz
assoc .tar=7-Zip.tar
assoc .tgz=7-Zip.tgz
assoc .rar=7-Zip.rar

ftype 7-Zip.7z="%PROGRAMFILES%\7-Zip\7zFM.exe" "%%1"
ftype 7-Zip.bz2="%PROGRAMFILES%\7-Zip\7zFM.exe" "%%1"
ftype 7-Zip.gz="%PROGRAMFILES%\7-Zip\7zFM.exe" "%%1"
ftype 7-Zip.tar="%PROGRAMFILES%\7-Zip\7zFM.exe" "%%1"
ftype 7-Zip.tgz="%PROGRAMFILES%\7-Zip\7zFM.exe" "%%1"
ftype 7-Zip.rar="%PROGRAMFILES%\7-Zip\7zFM.exe" "%%1"


REM ## STARTMENU ##
RENAME "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\7-Zip" "7-Zip 23.01"


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG ADD "HKU\DefaultUser\Software\7-Zip"         /v "Lang"         /t REG_SZ    /d "fr"       /f
REG ADD "HKU\DefaultUser\Software\7-Zip\Options" /v "CascadedMenu" /t REG_DWORD /d 1          /f
REG ADD "HKU\DefaultUser\Software\7-Zip\Options" /v "ContextMenu"  /t REG_DWORD /d 2147488631 /f
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
