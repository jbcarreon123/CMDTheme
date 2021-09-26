@echo off
:: CMDTheme - Theme Command Prompt
if not exist "%AppData%\CMDTheme" ( mkdir "%AppData%\CMDTheme")
set "themech=%1"

if exist "%AppData%\CMDTheme\config.bat" ( call "%AppData%\CMDTheme\config.bat")
if not exist "%AppData%\CMDTheme\default.bat" (
set "Default=None"
) else (
call "%AppData%\CMDTheme\default.bat"
)
if exist "%temp%\themes.log" ( del "%temp%\themes.log")
for /f "delims=" %%p in ('powershell dir -Path "%CMDTPath%\Themes" -Filter *.cmd -Name') do echo    %%p>> %temp%\themes.log
if exist "%temp%\themes2.log" ( del "%temp%\themes2.log")
powershell get-content "$env:temp\themes.log" ^| foreach{$_ -replace """.cmd""",""""""}^> $env:temp\themes2.log

cls
:themes
cls
echo  -------------------------------------------------
echo    [37mCMD[91mT[32mh[33me[34mm[35me[0m - Theme Command Prompt        v1.0.0
echo  -------------------------------------------------
echo    Default: %Default%

echo.

echo    Installed Themes:
type %temp%\themes2.log

if defined themech ( goto RunTheme)
:themeing

echo.
echo    What theme you want to use?
echo    Typing [4mExit[0m will exit
set /p "themech=[0m   > "

if "%themech%"=="exit" ( exit/b)
if "%themech%"=="EXIT" ( exit/b)
if "%themech%"=="Exit" ( exit/b)

if not exist "%CMDTPath%\Themes\%themech%.cmd" ( echo    That is not on the selection. & set "themech=" & goto themes)

:RunTheme
echo.
echo    What you want to do with %themech%?
echo.
echo    [36m[1][0m Set as Default

echo      Setting it as default
echo    [36m[2][0m Modify script
echo      Modify the script in Notepad
echo    [36m[3][0m Execute theme
echo      Execute the theme in cmd
echo.
echo    [36m[D][91m Delete theme[0m
if "%themech%"=="Default" ( echo     As this is an built-in theme, this will not be deleted.)
if "%themech%"=="DOS" ( echo     As this is an built-in theme, this will not be deleted.)
if "%themech%"=="PowerShell" ( echo      As this is an built-in theme, this will not be deleted.)
if "%themech%"=="default" ( echo     As this is an built-in theme, this will not be deleted.)
if "%themech%"=="dos" ( echo     As this is an built-in theme, this will not be deleted.)
if "%themech%"=="powershell" ( echo      As this is an built-in theme, this will not be deleted.)
echo.
echo    [36m[0][0m Go back to the Selection
choice /c 123d0 /n /m "[0m   > "
if "%errorlevel%"=="1" ( goto SetDefault)
if "%errorlevel%"=="2" ( goto ModifyScr)
if "%errorlevel%"=="3" ( goto Execute)
if "%errorlevel%"=="4" ( goto Delete)
if "%errorlevel%"=="5" ( set "themech=" & goto themes)

:SetDefault
echo set "default=%themech%"> %AppData%\CMDTheme\default.bat
echo.
echo    New default will be effective after restarting CMDTheme
goto RunTheme

:Delete
echo.
if "%themech%"=="Default" ( echo     As this is an built-in theme, this will not be deleted.)
if "%themech%"=="DOS" ( echo     As this is an built-in theme, this will not be deleted.)
if "%themech%"=="PowerShell" ( echo      As this is an built-in theme, this will not be deleted.)
if "%themech%"=="default" ( echo     As this is an built-in theme, this will not be deleted.)
if "%themech%"=="dos" ( echo     As this is an built-in theme, this will not be deleted.)
if "%themech%"=="powershell" ( echo      As this is an built-in theme, this will not be deleted.)
if not "%themech%"=="Default" ( echo    Deleting %themech%... & goto deltheme)
if not "%themech%"=="DOS" ( echo    Deleting %themech%... & goto deltheme)
if not "%themech%"=="PowerShell" ( echo    Deleting %themech%... & goto deltheme)
if not "%themech%"=="default" ( echo    Deleting %themech%... & goto deltheme)
if not "%themech%"=="dos" ( echo    Deleting %themech%... & goto deltheme)
if not "%themech%"=="powershell" ( echo    Deleting %themech%... & goto deltheme)
goto RunTheme

:deltheme
del %CMDTPath%\Themes\%themech%.bat
echo.
echo    Deleted %themech%.
goto RunTheme

:execute
echo.
echo    Executing %themech%...
echo.
"%CMDTPath%\theme.bat" %themech%
goto RunTheme

:modifyscr
notepad %CMDTPath%\Themes\%themech%.cmd
goto RunTheme