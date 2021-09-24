@echo off
cls
if "%1"=="" (
if exist "%AppData%\CMDTheme\default.bat" (
call "%AppData%\CMDTheme\default.bat"

)
) else (
set "theme=%1"
)


if "%theme%"=="" (
if not "%default%"=="" ( set "theme=%default%") else ( set "theme=None")
)

if "%theme%"=="None" (
set "theme=default"
)

%CMDTPath%\Themes\%theme%.cmd