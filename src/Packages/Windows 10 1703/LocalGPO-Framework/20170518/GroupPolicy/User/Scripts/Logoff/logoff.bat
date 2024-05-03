@echo off
IF "%username%"=="portail" GOTO FIN
for %%v in ("%~dp0scripts\*.bat") do (
	echo "%%~v"
	call "%%~v"
)
:FIN