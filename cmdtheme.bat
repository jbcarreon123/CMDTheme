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
for /f "delims=" %%p in ('powershell dir -Path %CMDTPath%\Themes -Filter *.cmd -Name') do echo    %%p>> %temp%\themes.log
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
echo    Typing [4mSettings[0m will put you on CMDTheme Settings
set /p "themech=[0m   > "

if "%themech%"=="Settings" ( goto Settings)
if "%themech%"=="settings" ( goto Settings)
if "%themech%"=="SETTINGS" ( goto Settings)
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

:settings
cls
echo.
if "%applied%"=="1" ( echo    Applied. Restart CMDTheme to see the changes. & set "applied=")
echo  -------------------------------------------------
echo    [37mCMD[91mT[32mh[33me[34mm[35me[0m - Settings                    v1.0.0
echo  -------------------------------------------------
echo.
if "%supuni%"=="1" (
echo    1 [X] Support Unicode [UTF-8]
) else (
echo    1 [ ] Support Unicode [UTF-8]
)

if "%runcmdst%"=="1" (
echo    2 [X] Run on CMD Startup [91m[NOT RECOMMENDED][0m
) else (
echo    2 [ ] Run on CMD Startup [91m[NOT RECOMMENDED][0m
)

if "%runstcmd%"=="1" (
echo    3 [X] Run startup files on CMD Startup
) else (
echo    3 [ ] Run startup files on CMD Startup
)

if "%chkupd%"=="1" (
echo    4 [X] Check for updates weekly
) else (
echo    4 [ ] Check for updates weekly
)

if "%disthe%"=="1" (
echo    5 [X] Disable all themes
) else (
echo    5 [ ] Disable all themes
)

echo.
echo    [0] Go back
echo    [A] Apply settings
echo    [U] Apply settings to all users [NEEDS ADMIN]
choice /c 123450au /n /m "[0m   > "
if "%errorlevel%"=="1" ( goto supuni)
if "%errorlevel%"=="2" ( goto runcmdst)
if "%errorlevel%"=="3" ( goto runstcmd)
if "%errorlevel%"=="4" ( goto chkupd)
if "%errorlevel%"=="5" ( goto disthe)
if "%errorlevel%"=="6" ( set "themech=" & goto themes)
if "%errorlevel%"=="7" ( goto apply)
if "%errorlevel%"=="8" ( goto applyall)

:supuni
if "%supuni%"=="" (
set "supuni=1"
goto settings
)
if "%supuni%"=="1" (
set "supuni="
goto settings
)
:runcmdst
if "%runcmdst%"=="" (
set "runcmdst=1"
goto settings
)
if "%runcmdst%"=="1" (
set "runcmdst="
goto settings
)

:runstcmd
if "%runstcmd%"=="" (
set "runstcmd=1"
goto settings
)
if "%runstcmd%"=="1" (
set "runstcmd="
goto settings
)

:chkupd
if "%chkupd%"=="" (
set "chkupd=1"
goto settings
)
if "%chkupd%"=="1" (
set "chkupd="
goto settings
)

:disthe
if "%disthe%"=="" (
set "disthe=1"
goto settings
)
if "%disthe%"=="1" (
set "disthe="
goto settings
)

:apply
(echo set "supuni=%supuni%"
echo set "runcmdst=%runcmdst%"
echo set "runstcmd=%runstcmd%"
echo set "chkupd=%chkupd%"
echo set "disthe=%disthe%")>"%AppData%\CMDTheme\config.bat"

set "applied=1"
goto settings

: