@echo off
title Eaglercraft Build

echo [1/4] Compiling client...
call .\gradlew.bat clean teavmc
if %errorlevel% neq 0 ( echo FAILED at client compile. & pause & exit /b 1 )

echo [2/4] Compiling server...
cd sp-server
call ..\gradlew.bat clean teavmc
if %errorlevel% neq 0 ( echo FAILED at server compile. & pause & exit /b 1 )
cd ..

echo [3/4] Compiling EPK assets...
call CompileEPK.bat
if %errorlevel% neq 0 ( echo FAILED at EPK step. & pause & exit /b 1 )

echo [4/4] Packaging final HTML...
cd ..
call ZipStableDownload.bat

echo Done! Opening game...
start stable-download\Offline_Download_Version.html