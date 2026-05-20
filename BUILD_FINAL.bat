@echo off
title Eaglercraft Build

echo [1/3] Compiling Java to JavaScript...
call .\gradlew.bat clean teavmc
if %errorlevel% neq 0 (
    echo BUILD FAILED at teavmc step.
    pause
    exit /b 1
)

echo [2/3] Compiling EPK assets...
call .\CompileEPK.bat
if %errorlevel% neq 0 (
    echo BUILD FAILED at EPK step.
    pause
    exit /b 1
)

echo [3/3] Packaging final HTML...
call .\ZipStableDownload.bat
if %errorlevel% neq 0 (
    echo BUILD FAILED at zip step.
    pause
    exit /b 1
)

echo Done! Opening game...
start stable-download\Offline_Download_Version.html