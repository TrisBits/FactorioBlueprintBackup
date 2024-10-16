@echo off

PowerShell.exe -ExecutionPolicy Bypass -NoProfile -WindowStyle Hidden -File "%~dp0\Backup-FactorioBlueprint.ps1"

REM Launch the game using the %command% value from Steam
%1
