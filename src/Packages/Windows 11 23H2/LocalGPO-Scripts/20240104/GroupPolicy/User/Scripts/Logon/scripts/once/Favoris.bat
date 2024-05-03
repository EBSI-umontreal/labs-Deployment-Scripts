REM Favoris
"%ProgramFiles%\7-Zip\7z.exe" x "%ProgramFiles(x86)%\EBSI\Favoris\Favoris.zip" -o%USERPROFILE%\Favorites -aoa
DEL "%USERPROFILE%\Favorites\Bing.url" /F