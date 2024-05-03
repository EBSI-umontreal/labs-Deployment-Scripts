@echo off
for %%v in ("%~dp0scripts\*.bat") do (
	echo "%%~v"
	call "%%~v"
)
