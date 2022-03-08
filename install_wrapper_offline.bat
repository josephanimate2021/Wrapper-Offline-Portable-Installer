:: Wrapper: Offline Installer
:: Creator: Joseph Animate 2021
@echo off
echo Enter 1 to install the stable edition of Wrapper: Offline
echo Enter 2 to install the beta version of Wrapper: Offline
echo:
set /p CHOICE=Choice:
if "!choice!"=="0" ( exit )
if "!choice!"=="1" goto download
if "!choice!"=="2" goto download_beta
echo Time to choose. && goto responces
:responces
cls
echo Enter 1 to install the stable edition of Wrapper: Offline
echo Enter 2 to install the beta version of Wrapper: Offline
echo:
set /p CHOICE=Choice:
if "!choice!"=="0" goto exit
if "!choice!"=="1" goto download
echo Time to choose. && goto responces
:download
cls
echo Installing Wrapper: Offline...
pushd ..\..\
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/Wrapper-Offline/Wrapper-Offline.git
echo Wrapper: Offline Has Been Installed
goto responces
:download_beta
cls
echo Installing Wrapper: Offline Beta...
pushd ..\..\
call Wrapper-Offline-Portable-Installer-main\Wrapper-Offline-Portable-Installer-main\PortableGit\bin\git.exe clone https://github.com/Wrapper-Offline/Wrapper-Offline-Beta.git
echo Wrapper: Offline Beta Has Been Installed
goto responces
