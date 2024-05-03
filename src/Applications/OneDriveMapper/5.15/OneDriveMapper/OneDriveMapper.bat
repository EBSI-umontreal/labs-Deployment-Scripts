@ECHO OFF
IF EXIST O:\ (GOTO ouvrir) ELSE (GOTO connecter)

:connecter
cls
ECHO Connexion a votre espace OneDrive Entreprise
ECHO.
ECHO Une fenetre vous demandant de vous authentifier apparaitra. Vous aurez besoin de valider votre 2e facteur d'authentification.
ECHO Le processus de connexion prendra plusieurs dizaines de secondes.
ECHO.
ECHO /!\ Recommandations /!\ 
ECHO . Evitez de travailler directement du lecteur O:, utilisez-le seulement comme espace de sauvegarde.
ECHO . L'espace disque qui apparait dans l'explorateur ne reflete pas le quota d'espace libre sur votre OneDrive.
ECHO. 
PAUSE
START powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0OneDriveMapper.ps1"
goto :eof

:ouvrir
IF EXIST O:\ explorer o:
goto : eof
