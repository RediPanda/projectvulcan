set rootDirectory=%cd%
:INIT
@ECHO OFF
CLS

set clientName=YulxVol Client Bootstrapper
set clientAuthor=RediPanda
set clientUser=YulxVol Corporations
set clientVersion=1.0

TITLE %clientName%

CLS

:MENU
cls
echo.
echo [ YULXVOL CLIENT BOOTSTRAPPER ]
echo.
echo.
echo    1 ] Launch Server Manager
echo.
echo         2 ] Updates
echo.
echo               3] Exit to Desktop
echo.
echo.
set /p "clientSel=> "
IF "%clientSel%"=="1" goto LAUNCHCHECK
IF "%clientSel%"=="2" goto UPDATECHECK
IF "%clientSel%"=="3" EXIT
goto MENU

:SETUP
CD /D %rootDirectory%
PUSHD %appdata%
MD RediPanda
PUSHD RediPanda
MD DL
MD data
goto INIT

:LAUNCHCHECK
PUSHD %appdata%
IF NOT EXIST RediPanda goto SETUP
PUSHD RediPanda
IF NOT EXIST DL goto SETUP
IF NOT EXIST data goto SETUP
PUSHD data
IF NOT EXIST jointsystem.bat goto UNKNOWNFILE 


:LAUNCHMENU
cls
echo.
echo Preparing to launch the YulxVol Systems Manager...
TIMEOUT 1 /NOBREAK >NUL
CALL jointsystem.bat
goto MENU

:UNKNOWNFILE
cls
echo.
echo The client system failed to find the executable file. Do you wish to reinstall the latest application?
echo.
echo [Y/N]
echo.
echo.
set /p "warnInstall=> "
IF "%warnInstall%"=="Y" goto UPDATECHECK
IF "%warnInstall%"=="y" goto UPDATECHECK
IF "%warnInstall%"=="N" goto MENU
IF "%warnInstall%"=="n" goto MENU

:UPDATECHECK
PUSHD %appdata%
IF NOT EXIST RediPanda goto SETUP
PUSHD RediPanda
IF NOT EXIST DL goto SETUP
IF NOT EXIST data goto SETUP

:UPDATEMENU
cls
echo.
echo.
echo   [Update System]
echo.
echo   1 ] Update/Install the latest application [YulxVol Server Manager]
echo.
echo   2 ] Update/Install the latest application [Client System]
echo.
echo   3 ] Exit to Main Menu
echo.
echo.
set /p "updateMenu=> "
IF "%updateMenu%"=="1" goto UPDATEAPP
IF "%updateMenu%"=="2" goto MENU
IF "%updateMenu%"=="3" goto MENU

:UPDATEAPP
PUSHD %appdata%
IF NOT EXIST RediPanda goto SETUP
PUSHD RediPanda
IF NOT EXIST DL goto SETUP
IF NOT EXIST data goto SETUP
goto UPDATEMANAGER

:UPDATEMANAGER
CD /D %rootDirectory%
PUSHD %appdata%
PUSHD RediPanda
PUSHD data
DEL /Q jointsystem.bat
bitsadmin.exe /transfer LatestUpdateJob "https://raw.githubusercontent.com/RediPanda/projectvulcan/master/jointsystem.bat" "%appdata%/RediPanda/data/jointsystem.bat"
cls
echo.
echo Please wait as we are applying new updates...
echo.
echo.
TIMEOUT 2 /NOBREAK >NUL
goto INIT