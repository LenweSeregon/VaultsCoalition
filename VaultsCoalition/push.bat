@echo off

@setlocal enableextensions
@cd /d "%~dp0"

@echo Pushing super project and all submodules - Start
cd ..
git push --recurse-submodules=on-demand
@echo Pushing super project and all submodules - Done

pause > nul