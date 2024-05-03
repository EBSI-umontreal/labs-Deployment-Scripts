IF "%PROCESSOR_ARCHITEW6432%"=="" GOTO native
%SystemRoot%\Sysnative\cmd.exe /c %0 %*
exit
:native
SET defaultUserFolder=%SystemDrive%\Users\Default


REM ************** INSTALL/UNINSTALL **************
REM ## INSTALL/UNINSTALL PROGRAM ##
XCOPY "%~dp0Desktop\*" "%defaultUserFolder%\Desktop" /Y /S


REM ## ADJUSTMENTS ##


REM ## STARTMENU ##


REM ******************** FILES ********************


REM **************** HKLM REGISTRY ****************


REM ************ DEFAULT USER REGISTRY ************
reg unload HKU\DefaultUser
attrib -h -s "%defaultUserFolder%\NTUSER.DAT"
reg load HKU\DefaultUser "%defaultUserFolder%\NTUSER.DAT"


rem Disable Windows Game DVR and Game Bar
reg add "HKU\DefaultUser\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d 0 /f
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f
rem Add workaround for bug that shows "You'll need a new app to open this ms-gamingoverlay" when starting a game
reg add "HKU\DefaultUser\Software\classes\ms-gamingoverlay" /t REG_SZ /d "URL:ms-gamingoverlay" /f

rem Disable Game Mode
reg add "HKU\DefaultUser\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 0 /f

rem Remove Chat button
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarMn /t REG_DWORD /d 0 /f

rem Disable "Let's finish up Windows" nag screen
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d 0 /f

rem Disable Windows Feedback
reg add "HKU\DefaultUser\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f

rem Turn off Sticky Key when Shift is pressed 5 times
reg add "HKU\DefaultUser\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d "506" /f

rem When shutting down Windows, automatically close applications instead of asking to confirm
reg add "HKU\DefaultUser\Control Panel\Desktop" /v "AutoEndTasks" /t REG_DWORD /d 1 /f

rem Always show more details in file copy dialog
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v EnthusiastMode /t REG_DWORD /d 1 /f

rem Disable Taskbar Widgets
reg add HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /f /v TaskbarDa /t REG_DWORD /d 0

rem Disable "Let Windows manage my default printer"
reg add "HKU\DefaultUser\Software\Microsoft\Windows NT\CurrentVersion\Windows" /f /v LegacyDefaultPrinterMode /t REG_DWORD /d 1

rem Remove 10 second startup delay for application restore
reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f

rem Restore classic context menus / disable "Show more options" menu entry on right-click
reg add "HKU\DefaultUser\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /t REG_SZ /d ""


REM ===============
REM =     EBSI    =
REM ===============


REM *************************************************************************
REM Explorateur Windows, Bureau
REM *************************************************************************
REM Activer la confirmation de suppression des fichiers
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ConfirmFileDelete" /t REG_DWORD /d 1 /f

REM Bureau - Personnaliser - Icones du bureau - Ce PC -> Affiché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f

REM Bureau - Personnaliser - Icones du bureau - Dossier de l'utilisateur -> Affiché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0 /f

REM Bureau - Personnaliser - Icones du bureau - OneDrive -> Masqué (comportement par défaut W11)
REM REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /t REG_DWORD /d 1 /f

REM Barre des tâches : Afficher la boite de recherche (comportement par défaut W11)
REM REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 2 /f

REM Barre des tâches : Masquer contacts (comportement par défaut W11)
REM REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f

REM Barre des tâches : Masquer Widgets
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f

REM Explorateur - Dérouler le ruban
REM REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Ribbon" /v "QatItems" /t REG_BINARY /d 3c7369713a637573746f6d554920786d6c6e733a7369713d22687474703a2f2f736368656d61732e6d6963726f736f66742e636f6d2f77696e646f77732f323030392f726962626f6e2f716174223e3c7369713a726962626f6e206d696e696d697a65643d2266616c7365223e3c7369713a71617420706f736974696f6e3d2230223e3c7369713a736861726564436f6e74726f6c733e3c7369713a636f6e74726f6c206964513d227369713a3136313238222076697369626c653d2266616c73652220617267756d656e743d223022202f3e3c7369713a636f6e74726f6c206964513d227369713a3136313239222076697369626c653d2266616c73652220617267756d656e743d223022202f3e3c7369713a636f6e74726f6c206964513d227369713a3132333532222076697369626c653d2266616c73652220617267756d656e743d223022202f3e3c7369713a636f6e74726f6c206964513d227369713a3132333834222076697369626c653d22747275652220617267756d656e743d223022202f3e3c7369713a636f6e74726f6c206964513d227369713a3132333336222076697369626c653d22747275652220617267756d656e743d223022202f3e3c7369713a636f6e74726f6c206964513d227369713a3132333537222076697369626c653d2266616c73652220617267756d656e743d223022202f3e3c2f7369713a736861726564436f6e74726f6c733e3c2f7369713a7161743e3c2f7369713a726962626f6e3e3c2f7369713a637573746f6d55493e /f

REM Explorateur - Masquer les bibliothèques (comportement par défaut W11)
REM REG ADD "HKU\DefaultUser\Software\Classes\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 0 /f

REM Explorer - Afficher - Affichage compact
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseCompactMode" /t REG_DWORD /d 1 /f

REM (inutile?) Explorateur - Option des dossiers - Affichage - Toujours afficher les menus -> Coché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t REG_DWORD /d 1 /f

REM (OK) Explorateur - Option des dossiers - Général - Ouvrir l'explorateur de fichier dans : Ce PC
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Afficher la barre d'état -> Coché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowStatusBar" /t REG_DWORD /d 1 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Afficher les information concernant la taille [...] -> Coché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowInfoTip" /t REG_DWORD /d 1 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Afficher les fichiers, dossiers et lecteurs cachés
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Masquer les conflits de fusion de dossiers -> Décoché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideMergeConflicts" /t REG_DWORD /d 0 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Masquer les extensions des fichiersdes fichiers dont le type est connu -> Décoché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Masquer les fichiers protégés du système d'exploitation -> Coché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 0 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Masquer les lecteurs vides -> Décoché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideDrivesWithNoMedia" /t REG_DWORD /d 0 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Ouvrir les fenêtres des dossiers dans un processus différent -> Coché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Utiliser l'assistant partage -> Décoché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SharingWizardOn" /t REG_DWORD /d 0 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Volet de navigation - Afficher tous les dossiers -> Décoché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d 1 /f

REM (OK) Explorateur - Option des dossiers - Affichage - Volet de navigation - Développer automatiquement jusqu'au dossier actif -> Coché
REG ADD "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneExpandToCurrentFolder" /t REG_DWORD /d 1 /f


REM **************************************************************
REM Paramètres
REM **************************************************************


REM *************************************************************************
REM Notification Center
REM *************************************************************************


REM *************************************************************************
REM Edge & Internet Explorer
REM *************************************************************************
REM IE - Always Open Internet Explorer 10, 11 In Maximized Window
REG ADD "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main" /v "Window_Placement" /t REG_BINARY /d 2C0000000200000003000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF160000001D0000003603000075020000 /f

REM IE - Désactiver "Do you want AutoComplete to remember web form entries"
REG ADD "HKU\DefaultUser\Software\Microsoft\Internet Explorer\IntelliForms" /v "AskUser" /t REG_DWORD /d 0 /f

REM IE - Options - Programmes - Bloc-notes par défaut pour l'édition de fichier HTML
REG ADD "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Default HTML Editor\shell\edit\command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\system32\NOTEPAD.EXE %1" /f

REM IE - Options - Avancé - Sécurité - Autoriser l'exécution de contenu actif dans mon ordinateur
REG ADD "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v "iexplore.exe" /t REG_DWORD /d 0 /f

REM IE - Options - Avancé - Sécurité - Autoriser l'exécution de contenu actif des CD dans mon ordinateur
REG ADD "HKU\DefaultUser\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN\Settings" /v "LOCALMACHINE_CD_UNLOCK" /t REG_DWORD /d 1 /f


REM *************************************************************************
REM Notification Center
REM *************************************************************************
REM Notification Center - Actions rapides
REM REG ADD "HKU\DefaultUser\Control Panel\Quick Actions\QuickActionsStateCapture" /v "PinnedSize" /t REG_DWORD /d 2 /f
REM REG ADD "HKU\DefaultUser\Control Panel\Quick Actions\QuickActionsStateCapture" /v "SlotPerRow" /t REG_DWORD /d 4 /f
REM REG ADD "HKU\DefaultUser\Control Panel\Quick Actions\QuickActionsStateCapture" /v "PinnedQuickActions" /t REG_SZ /d "Microsoft.QuickAction.AllSettings,Microsoft.QuickAction.BlueLightReduction" /f
REM REG ADD "HKU\DefaultUser\Control Panel\Quick Actions\QuickActionsStateCapture" /v "ActiveStates" /t REG_SZ /d "false,false" /f


reg unload HKU\DefaultUser
attrib +h +s "%defaultUserFolder%\NTUSER.DAT"
