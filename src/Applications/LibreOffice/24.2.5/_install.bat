IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0LibreOffice_24.2.5_Win_x86-64.msi" ALLUSERS=1 CREATEDESKTOPLINK=0 RebootYesNo=No ISCHECKFORPRODUCTUPDATES=0 REGISTER_ALL_MSO_TYPES=0 REGISTER_NO_MSO_TYPES=1 REGISTER_DOC=0 VC_REDIST=0 QUICKSTART=0 ADDLOCAL=ALL REMOVE=gm_o_Activexcontrol,gm_o_Extensions_MEDIAWIKI,gm_o_Extensions_NLPSolver,gm_o_Extensions_Script_Provider_For_BS,gm_o_Extensions_Script_Provider_For_JS,gm_o_Onlineupdate,gm_o_PostgresqlSdbc,gm_o_Pyuno_LibreLogo,gm_o_Quickstart,gm_o_Xsltfiltersamples,gm_Pyuno,gm_Script_Provider_For_Python
START /WAIT msiexec.exe /qn /norestart /i "%~dp0LibreOffice_24.2.5_Win_x86-64_helppack_fr.msi"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
MKDIR "%defaultUserFolder%\AppData\Roaming\LibreOffice\4\user"
COPY "%~dp0registrymodifications.xcu" "%defaultUserFolder%\AppData\Roaming\LibreOffice\4\user" /Y


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
