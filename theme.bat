@echo off
if "%1"=="" (
if exist "%AppData%\CMDTheme\default.bat" (
call "%AppData%\CMDTheme\default.bat"
)
set "theme=%default%"
) else (
set "theme=%1"
)

if "%theme%"=="" (
set "theme=None"
)

if "%theme%"=="None" (
set "theme=default"
)

%CMDTPath%\Themes\%theme%.cmd