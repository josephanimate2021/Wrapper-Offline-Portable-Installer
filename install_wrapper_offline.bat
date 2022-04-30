:: Wrapper: Offline Installer
:: Author: joseph the animator#2292
:: License: MIT
:: Set Some Installation Variables
set WOPATH=%USERPROFILE%\Downloads\Wrapper-Offline
set WORPATH=%USERPROFILE%\Downloads\Wrapper-Modded-Revision
set WOINSTALLPATH=%USERPROFILE%\Downloads\Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main
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
echo Enter 2 to install Wrapper: Offline Beta (This Installer Will Fix Some Stuff In Wrapper Offline Beta And Not Recomended)
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
pushd "..\..\"
echo Cloning repository from GitHub...
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/Wrapper-Offline/Wrapper-Offline.git
echo Wrapper: Offline Has Been Installed
pause
goto cls

:download_beta
:: Wrapper Offline 1.3.0 is broken. so alot has to be done here while the installation of Wrapper Offline 1.3.0 is peformed
cls
pushd "..\..\"
echo Cloning repository from GitHub...
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone --single-branch --branch beta https://github.com/Wrapper-Offline/Wrapper-Offline.git
:: Create the _ASSETS folder and install some dependicies
cd %WOPATH%\wrapper
if not exist _ASSETS ( md _ASSETS )
if not exist node_modules (
echo Wrapper: Offline Beta Has Been Installed. 
echo but the dependicies have to be installed in order for wrapper offline beta to run properly with no issues. 
echo you can close this once the installation has been done to the dependicies.
:: Copy the package-lock.json file required to install dependicies into the wrapper folder itself.
if exist package-lock.json (
npm install
) else (
copy %WOINSTALLPATH%\wrapper-1.3.0-mods-and-stuff\package-lock.json %WOPATH%\wrapper
npm install
)
echo All of the dependicies have been installed. 
echo This installer is now attempting to reapir Wrapper: Offline 1.3.0. 
echo When will those stupid wrapper offline devs get a life!
:: Add A Feature Where You Can Preview A Video From A Scene You Pick To Wrapper Offline 1.3.0 And Squash The Title Bug
cd %WOINSTALLPATH%\wrapper-1.3.0-mods-and-stuff\pages\js
del %WOPATH%\wrapper\pages\js\studio.js
copy studio.js %WOPATH%\wrapper\pages\js
cd ..\..\views
del %WOPATH%\wrapper\views\studio.eta
copy studio.eta %WOPATH%\wrapper\views
:: Copy the repaired database onto the _ASSETS Folder
cd ..\_ASSETS
copy database.json %WOPATH%\wrapper\_ASSETS
cd ..\
:: Fix start_wrapper.bat not auto updating
del %WOPATH%\start_wrapper.bat
copy start_wrapper.bat %WOPATH%
echo Wrapper: Offline 1.3.0 has been repaired! 
echo Please enjoy using it. 
echo if it breaks, you can consider telling the Wrapper: Offline Team about this since Joseph Animate 2022 Does Not Own Wrapper: Offline. 
echo This installer justs helps out on some repairing.
) else (
:: the node_modules folder has to be deleted to peform a fresh installation of the dependicies.
rd /q /s node_modules
echo Wrapper: Offline Beta Has Been Installed. 
echo but the dependicies have to be installed in order for wrapper offline beta to run properly with no issues. 
echo you can close this once the installation has been done to the dependicies.
:: Copy the package-lock.json file required to install dependicies into the wrapper folder itself.
if exist package-lock.json (
npm install
) else (
copy %WOINSTALLPATH%\wrapper-1.3.0-mods-and-stuff\package-lock.json %WOPATH%\wrapper
npm install
)
echo All of the dependicies have been installed. 
echo This installer is now attempting to reapir Wrapper: Offline 1.3.0. 
echo When will those stupid wrapper offline devs get a life!
:: Add A Feature Where You Can Preview A Video From A Scene You Pick To Wrapper Offline 1.3.0 And Squash The Title Bug
cd %WOINSTALLPATH%\wrapper-1.3.0-mods-and-stuff\pages\js
del %WOPATH%\wrapper\pages\js\studio.js
copy studio.js %WOPATH%\wrapper\pages\js
cd ..\..\views
del %WOPATH%\wrapper\views\studio.eta
copy studio.eta %WOPATH%\wrapper\views
:: Copy the repaired database onto the _ASSETS Folder
cd ..\_ASSETS
copy database.json %WOPATH%\wrapper\_ASSETS
cd ..\
:: Fix start_wrapper.bat not auto updating
del %WOPATH%\start_wrapper.bat
copy start_wrapper.bat %WOPATH%
echo Wrapper: Offline 1.3.0 has been repaired! 
echo Please enjoy using it. 
echo if it breaks, you can consider telling the Wrapper: Offline Team about this since Joseph Animate 2022 Does Not Own Wrapper: Offline. 
echo This installer justs helps out on some repairing.
)
goto clsbeta

:download_revision
cls
pushd "..\..\"
echo Cloning repository from GitHub...
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/josephanimate2021/Wrapper-Modded-Revision.git
echo Wrapper: Offline Revision Has Been Installed
pause
goto cls

:download_modded_wrapper
cls
pushd "..\..\"
echo Cloning repository from GitHub...
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/Rageyboi/Modded-Wrapper.git
echo The Modded Version Of Wrapper: Offline Has Been Installed
pause
goto cls

:exit
echo the Wrapper: Offline installer has been closed.
pause & exit

:clsbeta
pause
goto cls
