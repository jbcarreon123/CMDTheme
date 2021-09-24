@echo off
setlocal ENABLEDELAYEDEXPANSION
::--------------------------
title Windows PowerShell
chcp 65001 >nul
::--------------------------

echo Windows PowerShell
echo Copyright (C) Microsoft Corporation. All rights reserved.
echo.
echo Try the new cross-platform PowerShell https://aka.ms/pscore6
timeout 1 /nobreak >nul
echo.
:0
set "prpt="
set "direc=%cd%"
set /p "Prpt=PS %direc%> " || goto 0

%PrPt% 2>"%temp%\error.log"

if "%errorlevel%"=="9009" (
powershell %PrPt%
) else (
type "%temp%\error.log"
)
goto 0
