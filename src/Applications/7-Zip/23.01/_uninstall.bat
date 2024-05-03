IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%PROGRAMFILES%\7-Zip\Uninstall.exe" /S


REM ## ADJUSTMENTS ##
REM Associations
ftype 7-Zip.7z=
ftype 7-Zip.bz2=
ftype 7-Zip.gz=
ftype 7-Zip.tar=
ftype 7-Zip.tgz=
ftype 7-Zip.rar=

assoc .7z=
assoc .bz2=
assoc .gz=
assoc .tar=
assoc .tgz=
assoc .rar=


REM ## STARTMENU ##
RMDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\7-Zip 23.01" /S /Q


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG DELETE "HKU\DefaultUser\Software\7-Zip" /f


REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
