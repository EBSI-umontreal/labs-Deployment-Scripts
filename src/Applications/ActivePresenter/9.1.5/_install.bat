IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT "" "%~dp0ActivePresenter_v9.1.5_setup.exe" /VERYSILENT /NORESTART


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
del "%PUBLIC%\Desktop\Active Presenter.lnk" /F
RENAME "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\ActivePresenter" "ActivePresenter 9.1.5"


REM ******************** FILES ********************
MKDIR "%defaultUserFolder%\AppData\Roaming\ActivePresenter"
COPY "%~dp0ActivePresenter.apconfig" "%defaultUserFolder%\AppData\Roaming\ActivePresenter" /Y


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
