@echo off
setlocal enabledelayedexpansion
title Steam Workshop Splitter 

echo --------------------------------------------------
echo      Steam Workshop Splitter (Splitting Only)
echo --------------------------------------------------

:: Check for FFmpeg/FFprobe
if not exist "ffmpeg.exe" ( echo [ERROR] ffmpeg.exe not found! & pause & exit )

set /p "target_gif=Enter the name of your GIF (e.g., animation.gif): "
set "target_gif=%target_gif:"=%"

if not exist "%target_gif%" (
    echo [ERROR] File not found!
    pause
    exit
)

echo.


echo.
echo Processing...
if not exist "workshop_output" mkdir "workshop_output"

:: Offsets: 2, 162, 322, 482, 642
set "offsets=2 162 322 482 642"
set "count=1"

for %%o in (%offsets%) do (
    echo [PART !count!] Resizing and Cropping at offset %%o...
    ffmpeg -i "%target_gif%" -vf "scale=800:450,crop=158:450:%%o:0" -y "workshop_output\part_!count!.gif" >nul 2>&1
    set /a count+=1
)

echo.
echo --------------------------------------------------
echo DONE. 5 parts created in the 'workshop_output' folder.
echo You can now optimize these files manually if needed then use SteamArtwork GHP next.
echo --------------------------------------------------
pause