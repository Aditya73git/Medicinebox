@echo off
title ESP32 CP2102 Driver Auto-Installer
color 0A

:: Self-elevation check
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrator privileges to install CP2102 USB driver...
    powershell -NoProfile -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"
echo ========================================================
echo   SMART MEDIBOX - ESP32 USB DRIVER INSTALLER
echo ========================================================
echo.
echo Installing Silicon Labs CP210x USB Driver into Windows...
echo.

pnputil /add-driver "%~dp0CP210x_Driver\silabser.inf" /install

echo.
echo ========================================================
echo Driver installation finished!
echo.
echo Next steps:
echo  1. Connect your ESP32 with your 4-wire USB DATA cable.
echo  2. Refresh http://localhost:5000 in Chrome or Edge.
echo  3. Click "Connect USB" (or "Connect Serial Port").
echo ========================================================
echo.
pause
