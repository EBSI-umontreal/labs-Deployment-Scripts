RMDIR "C:\mtPro" /S /Q
MKDIR "C:\mtPro"
ROBOCOPY "%PROGRAMFILES(X86)%\EBSI\mtPro" "C:\mtPro" /mir
CSCRIPT DossiermtPro.wsf
