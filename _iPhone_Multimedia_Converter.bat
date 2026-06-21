@echo off
title iPhone Multimedia Converter
cls

setlocal enabledelayedexpansion

:: 1. Create the output folder if it does not exist
if not exist "Converted" mkdir "Converted"

:: 2. Check if FFmpeg is already present locally
if exist "Converted\ffmpeg.exe" (
    echo FFmpeg found locally. Skipping download.
    goto PROCESS_FILES
)

:: 3. If missing, download the latest release essentials directly from GitHub CDN (Blazing Fast)
echo FFmpeg is missing. Downloading the latest release...
curl -k -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" -o "Converted\ffmpeg.zip" "https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip"

if not exist "Converted\ffmpeg.zip" (
    echo Error: Download failed. Windows 'curl' could not fetch the file.
    pause
    exit /b
)

echo Extracting FFmpeg archive...
if exist "Converted\temp_extract" rmdir /s /q "Converted\temp_extract"
mkdir "Converted\temp_extract"
tar -xf "Converted\ffmpeg.zip" -C "Converted\temp_extract"

echo Deploying FFmpeg executable...
for /f "delims=" %%i in ('dir /b /s "Converted\temp_extract\ffmpeg.exe" 2^>nul') do (
    move /y "%%i" "Converted\ffmpeg.exe" >nul
)

:: Clean up temporary files and folders
del "Converted\ffmpeg.zip" >nul 2>&1
rmdir /s /q "Converted\temp_extract" >nul 2>&1

if not exist "Converted\ffmpeg.exe" (
    echo Error: Extraction failed or ffmpeg.exe was not found in the archive.
    pause
    exit /b
)
echo FFmpeg successfully installed locally.

:PROCESS_FILES
:: Count total target files (.heic and .mov combined)
set "TOTAL_FILES=0"
set "CURRENT_FILE=0"
for %%f in (*.heic) do ( if exist "%%f" set /a TOTAL_FILES+=1 )
for %%f in (*.mov) do ( if exist "%%f" set /a TOTAL_FILES+=1 )

cls

:: 4. Start processing specific allowed extensions only (.heic and .mov)
for %%f in (*.heic) do (
    if exist "%%f" (
        echo STARTING PHOTO CONVERSION .heic to .png
        echo.
        set /a CURRENT_FILE+=1
        if not exist "Converted\%%~nf.png" (
            echo [!CURRENT_FILE!/!TOTAL_FILES!] Processing %%f
            "Converted\ffmpeg.exe" -y -hide_banner -loglevel error -i "%%f" -q:v 1 "Converted\%%~nf.png"
        ) else (
            echo [!CURRENT_FILE!/!TOTAL_FILES!] Skipping %%f [already converted]
        )
        cls
    )
)

for %%f in (*.mov) do (
    if exist "%%f" (
        echo STARTING VIDEO CONVERSION .mov to .mp4
        echo.
        set /a CURRENT_FILE+=1
        if not exist "Converted\%%~nf.mp4" (
            echo [!CURRENT_FILE!/!TOTAL_FILES!] Processing %%f
            "Converted\ffmpeg.exe" -y -hide_banner -loglevel error -i "%%f" -c:v copy -c:a copy "Converted\%%~nf.mp4"
        ) else (
            echo [!CURRENT_FILE!/!TOTAL_FILES!] Skipping %%f [already converted]
        )
        cls
    )
)

cls
echo PROCESS COMPLETED!
echo Converted files are located in the 'Converted' folder.
pause