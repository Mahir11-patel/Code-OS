@echo off
setlocal
title KodeOS Ubuntu ISO Builder
echo ==========================================
echo          KODEOS UBUNTU ISO BUILDER
echo ==========================================
echo.
where wsl.exe >nul 2>nul
if errorlevel 1 (
  echo WSL2 is not installed. Open PowerShell as Administrator and run:
  echo   wsl --install -d Ubuntu-24.04
  echo Restart Windows, then run this file again.
  pause
  exit /b 1
)
wsl.exe -l -q | findstr /i "Ubuntu-24.04" >nul
if errorlevel 1 (
  echo Ubuntu-24.04 WSL distribution was not found.
  echo Install it with: wsl --install -d Ubuntu-24.04
  pause
  exit /b 1
)
set "WIN_DIR=%~dp0"
for /f "delims=" %%I in ('wsl.exe -d Ubuntu-24.04 -- wslpath -a "%WIN_DIR%"') do set "WSL_DIR=%%I"
if not defined WSL_DIR (
  echo Could not translate the project folder into a WSL path.
  pause
  exit /b 1
)
echo Building from: %WIN_DIR%
echo The first build downloads Ubuntu packages and needs internet.
wsl.exe -d Ubuntu-24.04 -- bash -lc "cd '%WSL_DIR%' && sudo bash kodeos-ubuntu/scripts/build.sh"
if errorlevel 1 (
  echo.
  echo KodeOS build failed. Read the error above.
  pause
  exit /b 1
)
echo.
echo Build completed. Look in:
echo %WIN_DIR%kodeos-ubuntu\output\KodeOS-Ubuntu-amd64.iso
pause
