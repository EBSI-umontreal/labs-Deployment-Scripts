IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
for %%i in (%~dp0\*.cer) do certutil -addstore -f "TrustedPublisher" %%i
START /WAIT "" "%~dp0VirtualBox-7.0.20-163906-Win.exe" -s -l -msiparams REBOOT=ReallySuppress ALLUSERS=2 VBOX_INSTALLDESKTOPSHORTCUT=0 VBOX_INSTALLQUICKLAUNCHSHORTCUT=0 VBOX_REGISTERFILEEXTENSIONS=1 ADDLOCAL=VBoxApplication,VBoxUSB,VBoxNetwork,VBoxNetworkFlt,VBoxNetworkAdp
START /WAIT "" "%ProgramFiles%\Oracle\VirtualBox\VBoxManage.exe"  extpack install --replace "%~dp0Oracle_VM_VirtualBox_Extension_Pack-7.0.20.vbox-extpack" --accept-license=33d7284dc4a0ece381196fda3cfe2ed0e1e8e7ed7f27b9a9ebc4ee22e24bd23c


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
MKDIR "%defaultUserFolder%\.VirtualBox"
COPY "%~dp0VirtualBox.xml" "%defaultUserFolder%\.VirtualBox" /Y


REM Icone bureau
DEL "%PUBLIC%\Desktop\Oracle VM VirtualBox.lnk" /F


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
