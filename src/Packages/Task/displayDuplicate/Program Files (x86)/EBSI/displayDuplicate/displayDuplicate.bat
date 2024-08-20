@echo off
setlocal enabledelayedexpansion

:: Récupérer l'ID de session et le nom de session de la session utilisateur actuelle
for /f "tokens=1,2,3" %%a in ('query session ^| findstr /R /C:"%USERNAME%"') do (
    set SESSION_NAME=%%a
    set SESSION_ID=%%c
)

:: Nettoyer le nom de session en supprimant les caractères inutiles
set SESSION_NAME=%SESSION_NAME:>=%

:: Afficher les valeurs pour le débogage
echo ID de session : %SESSION_ID%
echo Type de session : %SESSION_NAME%

:: Vérifier si la session est une session console (pas RDP)
if "%SESSION_NAME%"=="console" (
    "%WINDIR%\system32\DisplaySwitch.exe" /clone
)