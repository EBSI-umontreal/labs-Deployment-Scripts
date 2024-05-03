IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
REM IRFANVIEW
START /WAIT "" "%~dp0iview466_x64_setup.exe" /silent /desktop=0 /thumbs=0 /group=1 /allusers=1 /assoc=0 /ini="%%APPDATA%%\irfanview"
REM IRFANVIEW PLUGINS
START /WAIT "" "%~dp0iview466_plugins_x64_setup.exe" /silent


REM ## ADJUSTMENTS ##
COPY "%~dp0Program Files\i_view32.ini" "%PROGRAMFILES%\IrfanView\" /Y



REM ## STARTMENU ##
RENAME "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\IrfanView" "IrfanView 4.66"
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\IrfanView 4.66\About IrfanView.lnk" /F
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\IrfanView 4.66\Available Languages.lnk" /F
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\IrfanView 4.66\Available PlugIns.lnk" /F
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\IrfanView 4.66\Command line Options.lnk" /F
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\IrfanView 4.66\IrfanView - Thumbnails.lnk" /F
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\IrfanView 4.66\Uninstall IrfanView.lnk" /F
DEL "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\IrfanView 4.66\What's New.lnk" /F


REM ******************** FILES ********************
REM START /WAIT "" "%~dp0irfanview_lang_french.exe" /silent
MKDIR "%PROGRAMFILES%\IrfanView\Languages"
COPY "%~dp0\irfanview_lang_french\*.*" "%PROGRAMFILES%\IrfanView\Languages" /Y

REM DEFAULT USER
MKDIR "%defaultUserFolder%\AppData\Roaming\IrfanView"
COPY "%~dp0Roaming\i_view64.ini" "%defaultUserFolder%\AppData\Roaming\IrfanView" /Y

REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
