IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0Apache_OpenOffice_4.1.5_Win_x86_install_fr.exe" /S /v /qb SELECT_WORD=0 SELECT_EXCEL=0 SELECT_POWERPOINT=0 ADDLOCAL=ALL


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
del "%PUBLIC%\Desktop\OpenOffice 4.1.5.lnk" /F


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
