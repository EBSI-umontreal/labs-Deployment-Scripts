REM start "" "C:\Windows\Resources\Themes\EBSI-W11.theme" & timeout /t 3 & taskkill /im "systemsettings.exe" /f
START /WAIT "" "%~dp0themeswitcher.exe" "%systemroot%\Resources\Themes\EBSI-W11.theme"


