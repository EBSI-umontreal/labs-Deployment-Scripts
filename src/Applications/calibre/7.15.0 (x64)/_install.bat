IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0calibre-64bit-7.15.0.msi"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
RENAME "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\calibre 64bit - E-book Management\calibre 64bit - E-book management.lnk" "calibre - E-book management.lnk"
del "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\calibre 64bit - E-book Management\E-book viewer 64bit.lnk" /F
del "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\calibre 64bit - E-book Management\Edit E-book 64bit.lnk" /F
del "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\calibre 64bit - E-book Management\Get Involved.url" /F
del "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\calibre 64bit - E-book Management\LRF viewer 64bit.lnk" /F
del "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\calibre 64bit - E-book Management\User Manual.url" /F
RENAME "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\calibre 64bit - E-book Management" "calibre 7.15.0"


REM ******************** FILES ********************
del "%PUBLIC%\Desktop\calibre 64bit - E-book management.lnk" /F


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
