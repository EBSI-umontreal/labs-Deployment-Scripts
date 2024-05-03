IF "%PROCESSOR_ARCHITECTURE%"=="x86" GOTO x86

:x64
SET JAVA_HOME=%ProgramFiles(x86)%\Java\jre
GOTO go

:x86
SET JAVA_HOME=%ProgramFiles%\Java\jre
GOTO go

:go
MKDIR "C:\TEMPO\BaseX\data"
MKDIR "C:\TEMPO\BaseX\repo"
CALL "%~dp0bin\basexgui.bat"