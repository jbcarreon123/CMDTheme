@echo off
if "%1"=="" (
if not exist "%AppData%\CMDTheme\default.bat" (
set "Default=None"
) else (
call "%AppData%\CMDTheme\default.bat"
)
set "theme=%default%"
) else (
set "theme=%1"
)

%CMDTPath%\Themes\%theme%.cmd