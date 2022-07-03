:: Wrapper: Offline Installer
:: Author: joseph the animator#2292
:: License: MIT
title Wrapper: Offline Installer [Initializing...]

::::::::::::::::::::
:: Initialization ::
::::::::::::::::::::

:: Stop commands from spamming stuff, cleans up the screen
@echo off && cls

:: Lets variables work or something idk im not a nerd
SETLOCAL ENABLEDELAYEDEXPANSION

:: Make sure we're starting in the correct folder, and that it worked (otherwise things would go horribly wrong)
pushd "%~dp0"

:: Check *again* because it seems like sometimes it doesn't go into dp0 the first time???
pushd "%~dp0"

:::::::::::::::::::::::
:: Wrapper Installer ::
:::::::::::::::::::::::

title Wrapper: Offline Installer
:cls
cls

echo Wrapper: Offline Installer
echo Project led by GoTest334. 
echo Installer is created by the Wrapper Offline Team. 
echo Installer is recreated by Joseph Animate 2022.
echo:
echo Enter 1 to install Wrapper: Offline (Recomended)
echo Enter 2 to install Wrapper: Offline Beta
echo Enter 3 to install Wrapper: Offline Revision (Working Version Of Wrapper: Offline Beta And Recomended)
echo Enter 4 to install the modded version of Wrapper: Offline (if you want to mod wrapper)
echo Enter 0 to close the installer
:wrapperidle
echo:

:::::::::::::
:: Choices ::
:::::::::::::

set /p CHOICE=Choice:
if "!choice!"=="0" goto exit
if "!choice!"=="1" goto download
if "!choice!"=="2" goto download_beta
if "!choice!"=="3" goto download_revision
if "!choice!"=="4" goto download_modded_wrapper
echo Time to choose. && goto wrapperidle

:download
cls
echo Cloning repository from GitHub...
if exist .git (
cd %USERPROFILE%\Downloads
:: the portable git does not work for some people. So this should help a little. The user needs to have git installed first.
if not exist Wrapper-Offline-Portable-Installer\PortableGit\bin\git.exe (
git clone https://github.com/Wrapper-Offline/Wrapper-Offline.git
) else (
call Wrapper-Offline-Portable-Installer\PortableGit\bin\git.exe clone https://github.com/Wrapper-Offline/Wrapper-Offline.git
)
) else (
cd %USERPROFILE%\Downloads
:: the portable git does not work for some people. So this should help a little. The user needs to have git installed first.
if not exist Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe (
git clone https://github.com/Wrapper-Offline/Wrapper-Offline.git
) else (
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/Wrapper-Offline/Wrapper-Offline.git
)
)
echo Installing some npm packages...
cd Wrapper-Offline/wrapper
npm install
echo Wrapper: Offline Has Been Installed
pause
goto cls

:download_beta
cls
echo Cloning repository from GitHub...
if exist .git (
cd %USERPROFILE%\Downloads
call Wrapper-Offline-Portable-Installer\PortableGit\bin\git.exe clone --single-branch --branch beta https://github.com/Wrapper-Offline/Wrapper-Offline.git
) else (
cd ..\..\
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone --single-branch --branch beta https://github.com/Wrapper-Offline/Wrapper-Offline.git
)
echo Installing some npm packages...
cd Wrapper-Offline/wrapper
npm install
echo Wrapper: Offline Has Been Installed
pause
goto cls

:download_revision
cls
echo Cloning repository from GitHub...
if exist .git (
cd %USERPROFILE%\Downloads
call Wrapper-Offline-Portable-Installer\PortableGit\bin\git.exe clone https://github.com/josephanimate2021/Wrapper-Modded-Revision.git
) else (
cd ..\..\
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/josephanimate2021/Wrapper-Modded-Revision.git
)
echo Wrapper: Offline Revision Has Been Installed
pause
goto cls

:download_modded_wrapper
cls
echo Cloning repository from GitHub...
if exist .git (
cd %USERPROFILE%\Downloads
call Wrapper-Offline-Portable-Installer\PortableGit\bin\git.exe clone https://github.com/Rageyboi/Modded-Wrapper.git
) else (
cd ..\..\
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/Rageyboi/Modded-Wrapper.git
)
echo Installing some npm packages...
cd Modded-Wrapper/wrapper
npm install
echo Wrapper: Offline Modded Has Been Installed

:exit
echo the Wrapper: Offline installer has been closed.
pause & exit
