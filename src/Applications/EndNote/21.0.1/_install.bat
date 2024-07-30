IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0EN21Inst.msi" INSTALLALLCONTENTFILES=yes ADDLOCAL=ALL REMOVE=EndNoteClick USERCANAPPLYUPDATES=F


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************
XCOPY "%~dp0ADD_UdeM\*.*" "%ProgramFiles(x86)%\EndNote 21\" /S /Y
XCOPY "%~dp0ADD_EBSI\*.*" "%ProgramFiles(x86)%\EndNote 21\" /S /Y

MKDIR "%defaultUserFolder%\AppData\Roaming\EndNote"
COPY "%~dp0Roaming\EndNote\connection cache.21" "%defaultUserFolder%\AppData\Roaming\EndNote" /Y
COPY "%~dp0Roaming\EndNote\filter cache.21" "%defaultUserFolder%\AppData\Roaming\EndNote" /Y
COPY "%~dp0Roaming\EndNote\style cache.21" "%defaultUserFolder%\AppData\Roaming\EndNote" /Y


REM **************** HKLM REGISTRY ****************
REG ADD "HKLM\SOFTWARE\Wow6432Node\ISI ResearchSoft\EndNote\21" /v USERCANAPPLYUPDATES /t REG_SZ /d F /f


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Preferences" /V "AcceptedENX9EULA" /T "REG_MULTI_SZ" /D "T" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Preferences" /V "OpenLibsAtStarup" /T "REG_DWORD" /D 3 /F

REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Preferences" /V "PrefsString(002)" /T "REG_MULTI_SZ" /D "apa7th-fr-udem.ens" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Preferences" /V "PrefsString(054)" /T "REG_MULTI_SZ" /D "https://umontreal.on.worldcat.org/atoztitles/link" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Preferences" /V "PrefsString(055)" /T "REG_MULTI_SZ" /D "?sid=endnote&aufirst=AUFIRST&aulast=AULAST&issn=ISSN&isbn=ISBN&atitle=ATITLE&title=TITLE&volume=VOLUME&issue=ISSUE&date=DATE&spage=SPAGE&epage=EPAGE" /F

REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Plugins\WebServices" /V "Active Application" /T "REG_MULTI_SZ" /D "0" /F

REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style1" /T "REG_SZ" /D "apa7th-fr-udem" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style2" /T "REG_SZ" /D "APA6th-fr-UdeM" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style3" /T "REG_SZ" /D "APA6th-fr-UdeM-URL" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style4" /T "REG_SZ" /D "APA 7th" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style5" /T "REG_SZ" /D "Chicago15thB-EBSI" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style6" /T "REG_SZ" /D "CV_commun_canadien" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style7" /T "REG_SZ" /D "chicago-17th-auteur-date_fr-udem" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style8" /T "REG_SZ" /D "chicago-17th-auteur-date_fr-udem-url" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style9" /T "REG_SZ" /D "chicago-17th-note-bas-de-page-fr-udem" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style10" /T "REG_SZ" /D "chicago-17th-note-bas-de-page-fr-udem-url" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style11" /T "REG_SZ" /D "Numbered" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style12" /T "REG_SZ" /D "Show All Fields" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style13" /T "REG_SZ" /D "Author-Date" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style14" /T "REG_SZ" /D "Annotated" /F
REG ADD "HKU\DefaultUser\Software\ISI ResearchSoft\EndNote\Favorite Styles" /V "Style15" /T "REG_SZ" /D "MHRA (Author-Date)" /F
REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"


REM ************ PAUSE ************
ping 127.0.0.1 -n 10 > nul
