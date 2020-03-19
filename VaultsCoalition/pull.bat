@echo off

@setlocal enableextensions
@cd /d "%~dp0"

@echo Pulling super project and all submodules - Start
cd ..
git pull
git submodule update --recursive --remote
@echo Pulling super project and all submodules - Done

pause > nul