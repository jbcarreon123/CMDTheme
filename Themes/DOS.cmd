@echo off
setlocal ENABLEDELAYEDEXPANSION
::--------------------------
title C:\Windows\system\command.com
chcp 65001 >nul
::--------------------------

echo Starting MS-DOS...
timeout 1 /nobreak >nul
SET /p "=HIMEM is testing extended memory..." <nul
timeout 1 /nobreak >nul
echo  Done!

echo.
:0
set "prpt="
set "direc=%cd%"
set /p "Prpt=%direc%>" || goto 0

%PrPt% 2>"%temp%\error.log"

if "%errorlevel%"=="9009" (
echo Bad command or file name
) else (
type "%temp%\error.log"
)
goto 0
