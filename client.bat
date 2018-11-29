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