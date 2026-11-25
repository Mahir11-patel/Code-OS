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
  echo Then restart Windows and run this file again.
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
echo Starting the Linux build inside WSL...
wsl.exe -d Ubuntu-24.04 -- bash -lc "cd /mnt/c && echo 'Open the folder containing this BAT in WSL, then run: sudo bash kodeos-ubuntu/scripts/build.sh' "
echo.
echo Note: Run this BAT from the cloned repository folder. If the repository is on another drive,
echo access it in WSL under /mnt/<drive-letter>/...
pause
