MKDIR "C:\mtPro"
ROBOCOPY "%PROGRAMFILES(X86)%\EBSI\mtPro" "C:\mtPro" /mir
CSCRIPT "%~dp0DossiermtPro.wsf"
