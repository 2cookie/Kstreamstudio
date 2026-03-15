#!/bin/bash

clear
node -v
npm -v
if [ $? -ge 1 ]; then                                                                                                                                      
    echo "You didn't install nodejs and npm, check out the installation guide on github (https://github.com/2cookie/Kstreamstudio)"
fi
echo Welcome to Kstream Studio
echo Installing/Checking packages...
npm install express
if [ $? -ge 1 ]; then
    echo "Oh no, you have bad internet D:, you should change your Network/Wifi to a different one by using mobile hotspot or just borrow ur neighbors, if you are out of space, delete some files :P"
fi
npm install socket.io
if [ $? -ge 1 ]; then                                                                                                                                      
    echo "Oh no, you have bad internet D:, you should change your Network/Wifi to a different one by using mobile hotspot or just borrow ur neighbors, if you are out of space, delete some files :P"
fi
echo "Packages installed! starting server..."
node server.js
if [ $? -ge 1 ]; then                                                                                                                                      
    echo "Oh noes, something went wrong, make sure you don't move this file somewhere else from the project's root directory (commonly ~/Kstreamstudio)"
fi

