MKDIR "%UserProfile%\AppData\Roaming\Microsoft\Word\STARTUP"
COPY "%programfiles(x86)%\Zotero\extensions\zoteroWinWordIntegration@zotero.org\install\Zotero.dotm" "%UserProfile%\AppData\Roaming\Microsoft\Word\STARTUP" /Y
REG ADD "HKCU\Software\Microsoft\Office\16.0\Word\AddInLoadTimes" /v "%UserProfile%\AppData\Roaming\Microsoft\Word\STARTUP" /t REG_BINARY /f
