@echo off
IF "%username%"=="portail" GOTO FIN
for %%v in ("%~dp0scripts\*.bat") do (
	echo "%%~v"
	call "%%~v"
)
If Not Exist "%USERPROFILE%\once.txt" (
	for %%v in ("%~dp0scripts\once\*.bat") do (
		echo "%%~v"
		call "%%~v"
		echo. 2>"%USERPROFILE%\once.txt"
	)
)
:FIN
