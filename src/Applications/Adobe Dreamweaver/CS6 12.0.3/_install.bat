IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
START /WAIT msiexec.exe /qn /norestart /i "%~dp0Sources\Dreamweaver CS6.msi"


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##
MKDIR "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe Dreamweaver CS6"
MOVE /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe Dreamweaver CS6.lnk" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe Dreamweaver CS6"
MOVE /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe ExtendScript Toolkit CS6.lnk" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe Dreamweaver CS6"
MOVE /Y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe Extension Manager CS6.lnk" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Adobe Dreamweaver CS6"


REM ******************** FILES ********************
COPY "%~dp0EBSI\DocumentTypes\MMDocumentTypes.xml" "%ProgramFiles(x86)%\Adobe\Adobe Dreamweaver CS6\configuration\DocumentTypes" /Y
COPY "%~dp0EBSI\DocumentTypes\Default.xhtml" "%ProgramFiles(x86)%\Adobe\Adobe Dreamweaver CS6\configuration\DocumentTypes\NewDocuments" /Y

REM paramètres application
MKDIR "%defaultUserFolder%\AppData\Roaming\Adobe\Dreamweaver CS6"
ROBOCOPY "%~dp0EBSI\Roaming\Adobe\Dreamweaver CS6" "%defaultUserFolder%\AppData\Roaming\Adobe\Dreamweaver CS6" *.* /E

REM désactiver les MàJ
MKDIR "%defaultUserFolder%\AppData\Local\Adobe\AAMUpdater\1.0"
COPY "%~dp0EBSI\Local\Adobe\AAMUpdater\1.0\AdobeUpdaterPrefs.dat" "%defaultUserFolder%\AppData\Local\Adobe\AAMUpdater\1.0" /Y


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"

REM  MODIFICATIONS (début)

rem Préférences - Général
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\General Preferences" /v "Autorename Form Items" /t REG_SZ /d "FALSE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\General Preferences" /v "Show Start Page" /t REG_SZ /d "FALSE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\General Preferences" /v "Discover Dynamic Related Docs Method" /t REG_SZ /d "disabled" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\General Preferences" /v "Drop Office Action" /t REG_SZ /d ".htm" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\General Preferences" /v "Migrated Prefs" /t REG_SZ /d "FALSE" /f

rem Préférences - Aperçu dans le navigateur
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Browser Launch Menus" /v "Primary" /t REG_DWORD /d 1 /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Browser Launch Menus" /v "Secondary" /t REG_DWORD /d 0 /f

rem Préférences - Correction du code
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\HTML Preferences" /v "Encode Special Characters in URLs" /t REG_DWORD /d 1 /f

REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Font Preferences" /v "Number Encodings" /t REG_DWORD /d 11 /f

rem Préférences - Format de code
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Source Format" /v "Use Tabs" /t REG_SZ /d "TRUE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Source Format" /v "Indent Size" /t REG_DWORD /d 1 /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Source Format" /v "Ignore In Cell" /t REG_SZ /d "FALSE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Source Format" /v "Force Tag Case" /t REG_SZ /d "TRUE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Source Format" /v "Force Attr Case" /t REG_SZ /d "TRUE" /f

rem Préférences - Indicateurs de code
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Code Hints" /v "Closing Tag Completion" /t REG_SZ /d "After opening tag" /f

rem Préférences - Nouveau document
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\New Document Preferences\Default DTDs" /v "HTML" /t REG_SZ /d "mm_xhtml_1_strict" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Unicode Preferences" /v "Write Unicode Signature for UTF-8 Files" /t REG_SZ /d "TRUE" /f

rem Préférences - validateur W3C
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Validator Settings" /v "Default Doc Type" /t REG_DWORD /d 1 /f

rem Interface
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\FloaterStates\ThirdParty" /v "NumFloaters" /t REG_DWORD /d 2 /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\FloaterStates\ThirdParty" /v "Floater1" /t REG_SZ /d "BCModulePanel" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\FloaterStates\ThirdParty" /v "Floater2" /t REG_SZ /d "MultiscreenPreview" /f

REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Insert Panel Defaults2" /v "Insert View Mode" /t REG_SZ /d "0" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Insert Panel Defaults2" /v "Active Tab" /t REG_SZ /d "Commun" /f

REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Invisibles Defaults" /v "Show" /t REG_SZ /d "17817029" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Invisibles Defaults" /v "Visible" /t REG_SZ /d "TRUE" /f

REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Optional Dialog Windows" /v "templateFunkyNesting" /t REG_SZ /d "FALSE" /f

REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Property Inspector Preferences" /v "ViewCSSTab" /t REG_SZ /d "FALSE" /f

REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "LastDirectory" /t REG_SZ /d "" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "ShowTableHeaders" /t REG_SZ /d "TRUE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "initialFileTypeDlg" /t REG_SZ /d "TRUE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "LastPreferencesPage" /t REG_DWORD /d 789 /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "HeadContentVisible" /t REG_SZ /d "FALSE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "TextViewVisible" /t REG_SZ /d "TRUE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "CodeViewPrimary" /t REG_SZ /d "FALSE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "WysiwygViewVisible" /t REG_SZ /d "FALSE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "WysiwygPrimary" /t REG_SZ /d "FALSE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "SplitViewSize" /t REG_SZ /d "50.000000%%" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "TextViewActive" /t REG_SZ /d "TRUE" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "SplitViewOrientation" /t REG_SZ /d "vertical" /f
REG ADD "HKU\DefaultUser\Software\Adobe\Dreamweaver CS6\Settings" /v "LayoutMode" /t REG_SZ /d "FALSE" /f

REM  MODIFICATIONS (fin)

reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"
