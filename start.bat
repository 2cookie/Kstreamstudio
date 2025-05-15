@echo off
echo Welcome to Kstream Studio

echo Checking packages...
call npm install express
if errorlevel 1 (
    echo Oops an error occured please make sure you have node js installed and are in the right directory. if you need help feel free to dm 2cookie_79518 on discord
    pause
    exit /b 1
)

call npm install socket.io
if errorlevel 1 (
    echo Oops an error occured please make sure you have node js installed and are in the right directory. need help feel free to dm 2cookie_79518 on discord
    pause
    exit /b 1
)
echo Packages checked! starting server...

node server.js
if errorlevel 1 (
    echo Uh oh something went wrong please make sure you have node js installed. if you need help feel free to dm 2cookie_79518 on discord
)

pause
