@echo off

@setlocal enableextensions
@cd /d "%~dp0"

:: Constantes
set PROJECT_NAME=Vault's Coalition
set PROJECT_FOLDER=VaultsCoalition
set SUBMODULE_FOLDER_NAME=Submodules
set SUBMODULE_SCYLLA_NAME=Scylla
set SUBMODULE_SCYLLA_PATH=https://github.com/LenweSeregon/Scylla.git
set FOLDER_PLUGINS=Plugins
set FOLDER_ASSET=Assets

:: Saving current folder path
set currentFolder=%CD%

@echo ======================================================
@echo == Initializing submodules for %PROJECT_NAME% - START
@echo ======================================================
@echo.

:: Creating Plugin folder
@echo == Creating %FOLDER_PLUGINS% folder if not existing -- START
if not exist %currentFolder%\%FOLDER_ASSET%\%FOLDER_PLUGINS% mkdir %currentFolder%\%FOLDER_ASSET%\%FOLDER_PLUGINS%
@echo == Creating %FOLDER_PLUGINS% folder if not existing -- DONE
@echo.

:: Saving plugin folder path
cd %FOLDER_ASSET%\%FOLDER_PLUGINS%
set pluginsFolder=%CD%
cd ..\..

:: Creating Submodule folder
@echo == Creating %SUBMODULE_FOLDER_NAME% folder if not existing -- START
if not exist %currentFolder%\%SUBMODULE_FOLDER_NAME% mkdir %currentFolder%\%SUBMODULE_FOLDER_NAME%
@echo == Creating %SUBMODULE_FOLDER_NAME% folder if not existing -- DONE
@echo.

:: Adding Scylla as a submodule and init if it didn't exist
@echo == Adding %SUBMODULE_SCYLLA_NAME% submodule if not existing -- START
if not exist %currentFolder%\%SUBMODULE_FOLDER_NAME%\%SUBMODULE_SCYLLA_NAME% (
	cd %SUBMODULE_FOLDER_NAME%
	git submodule add --force %SUBMODULE_SCYLLA_PATH%
	git submodule update --init --recursive
	cd ..
)
@echo == Adding %SUBMODULE_SCYLLA_NAME% submodule if not existing -- DONE
@echo.

:: Adding Symlink Scylla to Plugin
@echo == Creating symlink %SUBMODULE_SCYLLA_NAME% in %FOLDER_PLUGINS% if not existing -- START
cd %pluginsFolder%
if exist %CD%\%SUBMODULE_SCYLLA_NAME% (
	@echo ==== Removing existing symlink
	@echo %CD%\%SUBMODULE_SCYLLA_NAME%
	rd %CD%\%SUBMODULE_SCYLLA_NAME%
)

if not exist %CD%\%SUBMODULE_SCYLLA_NAME% (
	@echo ==== Creating new symlink
	mklink /d %CD%\%SUBMODULE_SCYLLA_NAME% %currentFolder%\%SUBMODULE_FOLDER_NAME%\%SUBMODULE_SCYLLA_NAME%\%SUBMODULE_SCYLLA_NAME%\%FOLDER_ASSET%
)
@echo == Creating symlink %SUBMODULE_SCYLLA_NAME% in %FOLDER_PLUGINS% if not existing -- DONE
@echo.

@echo ======================================================
@echo == Initializing submodules for %PROJECT_NAME% - DONE
@echo ======================================================
:: Creating submodule folder

::@echo Creating submodules folder
::if exist %currentFolder%\%SUBMODULE_FOLDER_NAME% echo Folder %SUBMODULE_FOLDER_NAME% already exists - Skipping creation
::if not exist %currentFolder%\%SUBMODULE_FOLDER_NAME% mkdir %currentFolder%\%SUBMODULE_FOLDER_NAME%

:: Adding submodule

::@echo Adding submodule %SUBMODULE_SCYLLA_NAME% at path %SUBMODULE_SCYLLA_PATH%
::cd %SUBMODULE_FOLDER_NAME%
::git submodule add --force %SUBMODULE_SCYLLA_PATH%
::cd ..
::@echo Adding submodule %SUBMODULE_SCYLLA_NAME% done

:: Adding the Symlink

::@echo Adding Symlink
::cd %pluginsFolder%

::rd %CD%\%SUBMODULE_SCYLLA_NAME%
::mklink /d %CD%\%SUBMODULE_SCYLLA_NAME% %currentFolder%\%SUBMODULE_FOLDER_NAME%\%SUBMODULE_SCYLLA_NAME%\%SUBMODULE_SCYLLA_NAME%\%FOLDER_ASSET%
::@echo Adding Symlink done

pause > nul