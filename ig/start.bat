@echo off
del /F /Q wilksbarbers\*.*
instaloader wilksbarbers --no-captions --no-metadata-json --no-compress-json --no-profile-pic --fast-update 
cd wilksbarbers
del /F /Q id
for /f "skip=3 delims=" %%a in ('dir /a-d /o-d /b /s "%cd%"') do DEL "%%a"
set start=1

setlocal enableDelayedExpansion

for /r %%g in (*.jpg) do (call :RenameIt %%g)
goto :eof
goto :exit

:RenameIt
echo Renaming "%~nx1" to !start!%~x1
ren "%~nx1" !start!%~x1
set /a start+=1
goto :eof

:exit
pause
exit /b
