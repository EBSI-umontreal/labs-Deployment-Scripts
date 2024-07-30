RMDIR "%USERPROFILE%\.vscode" /s /q 
RMDIR "%USERPROFILE%\AppData\Roaming\Code\" /s /q
MKDIR "%USERPROFILE%\.vscode"
MKDIR "%USERPROFILE%\AppData\Roaming\Code\User"
CALL "%ProgramFiles%\Microsoft VS Code\bin\code" --install-extension "%PROGRAMFILES(X86)%\EBSI\Code\vscode-language-pack-fr-1.91.2024071009_vsixhub.com.vsix"
(
echo {
echo    "window.autoDetectColorScheme": true,
echo    "workbench.colorTheme": "Default Light Modern"
echo }
) > "%USERPROFILE%\AppData\Roaming\Code\User\settings.json"

REM del "%USERPROFILE%\.vscode\argv.json" /q
REM (
REM echo {
REM echo    "locale": "fr"
REM echo }
REM ) > "%USERPROFILE%\.vscode\argv.json"

REM  Il semble y avoir un bogue avec code : quand il existe dejà un fichier argv.json, code rajoute des éléments, mais ne respecte pas la syntaxe du json (il agit comme si le fichier était vide).
REM  La solution consiste donc à démarrer code pour qu'il génère le fichier  argv.json, et de le modifier ensuite pour ajouter la langue FR
powershell -command "Start-Process -windowstyle hidden '%ProgramFiles%\Microsoft VS Code\code.exe'"
timeout /T 5
taskkill /IM "Code.exe" /F
powershell -Command "(Get-Content -path '%USERPROFILE%\.vscode\argv.json' -Raw) -replace '}', ',\"locale\": \"fr\"}' | Set-Content -Path '%USERPROFILE%\.vscode\argv.json'"
