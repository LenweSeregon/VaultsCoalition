@echo off

@setlocal enableextensions
@cd /d "%~dp0"

:: Constantes
set SUBMODULE_FOLDER_NAME=Submodules
set SUBMODULE_SCYLLA_NAME=Scylla
set SUBMODULE_SCYLLA_PATH=https://github.com/LenweSeregon/Scylla.git
set FOLDER_PLUGINS=Plugins
set FOLDER_ASSET=Assets

:: Initializing paths
set currentFolder=%CD%
cd %FOLDER_ASSET%\%FOLDER_PLUGINS%
set pluginsFolder=%CD%
cd ..\..

:: Creating submodule folder
@echo Creating submodules folder
if exist %currentFolder%\%SUBMODULE_FOLDER_NAME% echo Folder %SUBMODULE_FOLDER_NAME% already exists - Skipping creation
if not exist %currentFolder%\%SUBMODULE_FOLDER_NAME% mkdir %currentFolder%\%SUBMODULE_FOLDER_NAME%

:: Adding submodule
@echo Adding submodule %SUBMODULE_SCYLLA_NAME% at path %SUBMODULE_SCYLLA_PATH%
cd %SUBMODULE_FOLDER_NAME%
git submodule add --force %SUBMODULE_SCYLLA_PATH%
cd ..
@echo Adding submodule %SUBMODULE_SCYLLA_NAME% done

:: Adding the Symlink
@echo Adding Symlink
if not exist %currentFolder%\%FOLDER_ASSET%\%VAULTS_FOLDER_PLUGINS% mkdir %currentFolder%\%FOLDER_ASSET%\%VAULTS_FOLDER_PLUGINS%
cd %pluginsFolder%

rd %CD%\%SUBMODULE_SCYLLA_NAME%
mklink /d %CD%\%SUBMODULE_SCYLLA_NAME% %currentFolder%\%SUBMODULE_FOLDER_NAME%\%SUBMODULE_SCYLLA_NAME%\%SUBMODULE_SCYLLA_NAME%\%FOLDER_ASSET%
@echo Adding Symlink done

pause > nul