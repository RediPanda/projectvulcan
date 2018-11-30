set rootManagerDirectory=%appdata%/RediPanda/data
:INIT
@ECHO OFF
REM // VARIABLES

set applicationName=YulxVol Server Manager
set applicationAuthor=RediPanda
set applicationUser=YulxVol Corporations
set applicationVersion=1.1

set serverName1=BungeeCord Proxy
set serverName2=Hub Server
set serverName3=Skyblock Server
set serverName4=Creative Server
set serverName5=Prison Server
set serverName6=

REM // DIRECTORIES
set mainServerRootDirectory=C:\runningservers\servers

set updateParamater=0
set updateAddress=
set updateMessage=[You are currently running the latest version!]

TITLE %applicationName% // By : %applicationAuthor% for %applicationUser%

REM // CHECKLIST
CD /D %rootDirectory%
PUSHD %appdata%
IF NOT EXIST RediPanda goto SETUP
PUSHD RediPanda
IF NOT EXIST DL goto SETUP
IF NOT EXIST data goto SETUP
goto UPDATEFETCHER

:SETUP
CD /D %rootDirectory%
PUSHD %appdata%
MD RediPanda
PUSHD RediPanda
MD DL
MD data
goto SETUPMSG

:SETUPMSG
cls
echo First-Time Setup has initiated...
echo.
echo Please wait as the %applicationName% is setting up some stuff...
echo.
echo.
TIMEOUT 2 /NOBREAK >NUL
goto INIT


REM // API MANAGER RUNNER


:UPDATEFETCHER
CD /D %rootDirectory%
PUSHD %appdata%
PUSHD RediPanda
PUSHD DL
DEL /Q latest.bat
cls
bitsadmin.exe /transfer LatestCheckJob "https://raw.githubusercontent.com/RediPanda/projectvulcan/master/latest.bat" "%appdata%/RediPanda/DL/latest.bat"
TIMEOUT 1 /NOBREAK >NUL
CALL latest.bat
IF NOT %applicationVersion%==%latestVersion% set updateParamater=1
TIMEOUT 1 /NOBREAK >NUL
IF %updateParamater%==1 goto UPDATEMSG
CLS
echo.
echo Checking for latest updates...
echo.
echo.
TIMEOUT 1 /NOBREAK >NUL
goto MENU

:UPDATEMSG
set updateMessage=[A latest update is available! Download V: %latestVersion% from the client application!]
REM // OFFICIAL MENU CODE STARTS HERE <--------------------------------------------------->

:MENU
color 0d
cls
echo.
echo Connected to: %mainServerRootDirectory%
echo.
echo ==================================================
echo =            YULXVOL SERVER MANAGER              =
echo ==================================================
echo.
echo.
echo     1 ] Start all Servers (Minecraft)
echo.
echo     2 ] Update all Servers (Minecraft)
echo.
echo     3 ] Start %serverName1%
echo.
echo     4 ] Start %serverName2%
echo.
echo     5 ] Start %serverName3%
echo.
echo     6 ] Start %serverName4%
echo.
echo     7 ] Start %serverName5%
echo.
echo     8 ] Exit to Client
echo.
echo     9 ] Exit to Desktop
echo.
echo Running Version: %applicationVersion% 
echo.
echo %updateMessage%
echo.
echo.
set /p "userSel=> "
IF "%userSel%"=="1" goto STARTALLMC
IF "%userSel%"=="2" goto UPDATEALLMC
IF "%userSel%"=="3" goto STARTSERVER1
IF "%userSel%"=="4" goto STARTSERVER2
IF "%userSel%"=="5" goto STARTSERVER3
IF "%userSel%"=="6" goto STARTSERVER4
IF "%userSel%"=="7" goto STARTSERVER5
IF "%userSel%"=="8" goto ENDOFFILE
IF "%userSel%"=="9" EXIT
goto MENU


REM // DO NOT MODIFY OR TOUCH THIS LINE / DO NOT PUT ANY CODE FURTHER THAN THIS LINE.
:ENDOFFILE