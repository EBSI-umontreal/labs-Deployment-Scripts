MKDIR "%PROGRAMFILES(X86)%\veraPDF"
ROBOCOPY "%PROGRAMFILES(X86)%\EBSI\veraPDF" "%PROGRAMFILES(X86)%\veraPDF" /mir
ICACLS "%PROGRAMFILES(X86)%\veraPDF" /grant .\Utilisateurs:(OI)(CI)F
