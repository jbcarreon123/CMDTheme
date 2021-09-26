@echo off
setlocal ENABLEDELAYEDEXPANSION

::Put your startup commands here

::--------------------------
title Example Theme
chcp 65001 >nul
doskey settings=%CMDTPath%\cmdtheme.bat
::--------------------------

::Put your startup text here

:0
echo.
::Put your loop commands here
::Put your top of > prompt text here
set /p "Prpt=[0m > " || goto 0 & REM Put your > prompt text here

%PrPt% 2>"%temp%\error.log"

if "%errorlevel%"=="9009" (
::Put your error commands here
) else (
type "%temp%\error.log"
)
goto 0