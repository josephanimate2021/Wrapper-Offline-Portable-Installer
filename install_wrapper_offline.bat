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
echo Enter 2 to install Wrapper: Offline Beta (Broken And Not Recomended)
echo Enter 3 to install Wrapper: Offline Revision (Working Version Of Wrapper: Offline Beta And Recomended)
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
echo Time to choose. && goto wrapperidle

:download
cls
pushd "..\..\"
echo Cloning repository from GitHub...
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/Wrapper-Offline/Wrapper-Offline.git
echo Wrapper: Offline Has Been Installed
pause
goto cls
:: Wrapper Offline 1.3.0 is broken. so alot has to be done here while the installation of Wrapper Offline 1.3.0 is peformed
:download_beta
cls
pushd "..\..\"
echo Cloning repository from GitHub...
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone --single-branch --branch beta https://github.com/Wrapper-Offline/Wrapper-Offline.git
:: Create the _ASSETS folder and install some dependicies
pushd Wrapper-Offline/wrapper
if not exist _ASSETS (
md _ASSETS
)
if not exist node_modules (
echo Wrapper: Offline Beta Has Been Installed. but the dependicies for wrapper have to be installed in order to run properly. you can close this once the installation has been done to the dependicies.
npm install
echo All of the dependicies have been installed.
pause
goto cls
) else (
:: the node_modules folder has to be deleted to peform a fresh installation of the dependicies.
rd /q /s node_modules
echo Wrapper: Offline Beta Has Been Installed. but the dependicies for wrapper have to be installed in order to run properly. you can close this once the installation has been done to the dependicies.
npm install
echo All of the dependicies have been installed.
pause
goto cls
)

:download_revision
cls
pushd "..\..\"
echo Cloning repository from GitHub...
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/josephanimate2021/Wrapper-Modded-Revision.git
echo Wrapper: Offline Revision Has Been Installed
pause
goto cls

:exit
echo the Wrapper: Offline installer has been closed.
pause & exit
