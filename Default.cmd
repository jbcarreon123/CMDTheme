@echo off
setlocal ENABLEDELAYEDEXPANSION

if exist "%AppData%\CMDTheme\config.bat" ( call "%AppData%\CMDTheme\config.bat")
if not exist "%AppData%\CMDTheme\default.bat" (
set "Default=None"
) else (
call "%AppData%\CMDTheme\default.bat"
)

::--------------------------
title CMDTheme v1.0.0 [Default Theme]
chcp 65001 >nul
doskey settings=%CMDTPath%\cmdtheme.bat
::--------------------------

echo  -------------------------------------------------
echo    [37mCMD[91mT[32mh[33me[34mm[35me[0m - Theme Command Prompt        v1.0.0
echo  -------------------------------------------------
echo    Default: %Default%


:0
echo.
set "prpt="
set "direc=%cd%"
for /f "delims=" %%H in ('time /t') do set "timet=%%H"
echo  [37mCMD[91mT[32mh[33me[34mm[35me[0m ^| %timet% ^| %direc%
set /p "Prpt=[0m > " || goto 0

%PrPt% 2>"%temp%\error.log"

if "%errorlevel%"=="9009" (
echo  [91m[ERR][0m '%PrPt%' is not an command, or an file.
) else (
type "%temp%\error.log"
)
goto 0