:: Wrapper: Offline Installer
:: Author: joseph the animator#2292
:: License: MIT
:: Set Some Installation Variables
set WOPATH=%USERPROFILE%\Downloads\Wrapper-Offline
set WORPATH=%USERPROFILE%\Downloads\Wrapper-Modded-Revision
if exist .git (
set WOINSTALLPATH=%USERPROFILE%\Downloads\Wrapper-Offline-Portable-Installer
) else (
set WOINSTALLPATH=%USERPROFILE%\Downloads\Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main
)
set WOMPATH=%USERPROFILE%\Downloads\Modded-Wrapper
set STATEMENT=installed
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
echo Enter 5 to reapir Wrapper: Offline Beta. (it is so broken right now so this installer should at least help out with some repairing.)
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
if "!choice!"=="5" goto callWrapperRepair
echo Time to choose. && goto wrapperidle

:download
cls
echo Cloning repository from GitHub...
if exist .git (
cd %USERPROFILE%\Downloads
call Wrapper-Offline-Portable-Installer\PortableGit\bin\git.exe clone https://github.com/Wrapper-Offline/Wrapper-Offline.git
) else (
cd ..\..\
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/Wrapper-Offline/Wrapper-Offline.git
)
echo Wrapper: Offline Has Been Installed
cd %WOPATH%\wrapper
if not exist node_modules (
if exist package-lock.json (
echo you may close this installer once the dependicies needed for wrapper to run are installed.
npm install
echo All Of The Dependicies Are Installed.
pause
) else (
echo you may close this installer once the dependicies needed for wrapper to run are installed.
copy %WOINSTALLPATH%\wrapper-1.3.0-mods-and-stuff\npm-packages\1.2.3\package-lock.json %WOPATH%\wrapper
npm install
echo All Of The Dependicies Are Installed.
pause
)
)

:download_beta
:wrapperRepair
cls
if "%REPAIRINGWRAPPER%"=="" (
echo Cloning repository from GitHub...
if exist .git (
cd %USERPROFILE%\Downloads
call Wrapper-Offline-Portable-Installer\PortableGit\bin\git.exe clone --single-branch --branch beta https://github.com/Wrapper-Offline/Wrapper-Offline.git
) else (
cd ..\..\
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone --single-branch --branch beta https://github.com/Wrapper-Offline/Wrapper-Offline.git
)
) else (
echo Starting Repair For Wrapper: Offline 1.3.0.....
)
cd %WOPATH%\wrapper
if not exist _ASSETS ( md _ASSETS )
if not exist node_modules (
if "%REPAIRINGWRAPPER%"=="" (
echo Wrapper: Offline Beta Has Been Installed. 
echo but the dependicies have to be installed in order for wrapper offline beta to run properly with no issues. 
echo you can close this once the installation has been done to the dependicies.
) else ( echo Installing Some NPM Packages AGAIN!! )
if exist package-lock.json (
npm install
) else (
copy %WOINSTALLPATH%\wrapper-1.3.0-mods-and-stuff\package-lock.json %WOPATH%\wrapper
npm install
)
echo All of the dependicies have been %STATEMENT%. 
echo This installer is now attempting to reapir Wrapper: Offline 1.3.0. 
echo When will those stupid wrapper offline devs get a life!
cd %WOINSTALLPATH%\wrapper-1.3.0-mods-and-stuff\pages\js
del %WOPATH%\wrapper\pages\js\studio.js
copy studio.js %WOPATH%\wrapper\pages\js
cd ..\html
del %WOPATH%\wrapper\pages\html\list.html
copy list.html %WOPATH%\wrapper\pages\html
cd ..\..\views
del %WOPATH%\wrapper\views\studio.eta
del %WOPATH%\wrapper\views\player.eta
del %WOPATH%\wrapper\views\char.eta
copy studio.eta %WOPATH%\wrapper\views
copy char.eta %WOPATH%\wrapper\views
copy player.eta %WOPATH%\wrapper\views
cd ..\_ASSETS
if not exist %WOPATH%\wrapper\_ASSETS\database.json (
copy database.json %WOPATH%\wrapper\_ASSETS
)
cd ..\
del %WOPATH%\start_wrapper.bat
copy start_wrapper.bat %WOPATH%
if exist %WOPATH%\utilities\config.bat (
del %WOPATH%\utilities\config.bat
)
echo Wrapper: Offline 1.3.0 has been repaired! 
echo Please enjoy using it. 
echo if it breaks, 
echo you may consider telling the Wrapper: Offline Team about this since Joseph Animate 2022 Does Not Own Wrapper: Offline. 
echo This installer justs helps out on some repairing.
pause
) else (
rd /q /s node_modules
if "%REPAIRINGWRAPPER%"=="" (
echo Wrapper: Offline Beta Has Been Installed. 
echo but the dependicies have to be installed in order for wrapper offline beta to run properly with no issues. 
echo you can close this once the installation has been done to the dependicies.
) else (
echo Installing Some NPM Packages AGAIN!!
)
if exist package-lock.json (
npm install
) else (
copy %WOINSTALLPATH%\wrapper-1.3.0-mods-and-stuff\package-lock.json %WOPATH%\wrapper
npm install
)
echo All of the dependicies have been %STATEMENT%.
echo This installer is now attempting to reapir Wrapper: Offline 1.3.0. 
echo When will those stupid wrapper offline devs get a life!
cd %WOINSTALLPATH%\wrapper-1.3.0-mods-and-stuff\pages\js
del %WOPATH%\wrapper\pages\js\studio.js
copy studio.js %WOPATH%\wrapper\pages\js
cd ..\html
del %WOPATH%\wrapper\pages\html\list.html
copy list.html %WOPATH%\wrapper\pages\html
cd ..\..\views
del %WOPATH%\wrapper\views\studio.eta
del %WOPATH%\wrapper\views\player.eta
del %WOPATH%\wrapper\views\char.eta
copy studio.eta %WOPATH%\wrapper\views
copy char.eta %WOPATH%\wrapper\views
copy player.eta %WOPATH%\wrapper\views
cd ..\_ASSETS
if not exist %WOPATH%\wrapper\_ASSETS\database.json (
copy database.json %WOPATH%\wrapper\_ASSETS
)
cd ..\
del %WOPATH%\start_wrapper.bat
copy start_wrapper.bat %WOPATH%
if exist %WOPATH%\utilities\config.bat (
del %WOPATH%\utilities\config.bat
)
echo Wrapper: Offline 1.3.0 has been repaired! 
echo Please enjoy using it. 
echo if it breaks, 
echo you may consider telling the Wrapper: Offline Team about this since Joseph Animate 2022 Does Not Own Wrapper: Offline. 
echo This installer justs helps out on some repairing.
pause
)

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
echo The Modded Version Of Wrapper: Offline Has Been Installed. 
cd %WOMPATH%\wrapper
if not exist node_modules (
if exist package-lock.json (
echo you may close this installer once the dependicies needed for Modded wrapper to run are installed.
npm install
echo All Of The Dependicies Are Installed.
pause
) else (
echo you may close this installer once the dependicies needed for Modded wrapper to run are installed.
copy %WOINSTALLPATH%\wrapper-1.3.0-mods-and-stuff\npm-packages\1.2.3\package-lock.json %WOMPATH%\wrapper
npm install
echo All Of The Dependicies Are Installed.
pause
)
)

:exit
echo the Wrapper: Offline installer has been closed.
pause & exit

:callWrapperRepair
set REPAIRINGWRAPPER=y
set STATEMENT=repaired
goto wrapperRepair
