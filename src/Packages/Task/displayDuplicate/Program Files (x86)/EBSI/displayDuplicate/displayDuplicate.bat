@echo off
setlocal enabledelayedexpansion

:: R�cup�rer l'ID de session et le nom de session de la session utilisateur actuelle
for /f "tokens=1,2,3" %%a in ('query session ^| findstr /R /C:"%USERNAME%"') do (
    set SESSION_NAME=%%a
    set SESSION_ID=%%c
)

:: Nettoyer le nom de session en supprimant les caract�res inutiles
set SESSION_NAME=%SESSION_NAME:>=%

:: Afficher les valeurs pour le d�bogage
echo ID de session : %SESSION_ID%
echo Type de session : %SESSION_NAME%

:: V�rifier si la session est une session console (pas RDP)
if "%SESSION_NAME%"=="console" (
    "%WINDIR%\system32\DisplaySwitch.exe" /clone
)