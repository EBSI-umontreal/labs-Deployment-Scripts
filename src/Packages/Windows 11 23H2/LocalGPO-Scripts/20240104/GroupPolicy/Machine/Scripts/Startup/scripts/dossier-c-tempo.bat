REM REINITIALISER LE DOSSIER TEMPO
rmdir "c:\tempo\" /S /Q
cscript "%~dp0dossier-c-tempo.wsf"
mklink /j c:\tempo d:\
