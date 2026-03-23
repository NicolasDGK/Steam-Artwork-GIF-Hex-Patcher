@echo off
setlocal
title Steam Artwork GIF Hex Patcher 

echo --------------------------------------------------
echo      Steam Artwork GIF Hex Patcher
echo --------------------------------------------------

echo --- If you want to split a gif into 5 parts use the Workshop Splitter instead ---
echo --- Make sure GIFs are in the same folder as this script or in a 'workshop_output' subfolder. ---
echo --- GIFs should be under 5 MB to be able to upload them to Steam, optimize them first then run this script. ---

:: Detection Logic
set "target_dir=."
if exist "workshop_output\" (
    set "target_dir=workshop_output"
    echo [INFO] Detected 'workshop_output' folder. GIFs inside that folder will be patched.
) else (
    echo [INFO] No 'workshop_output' found. Patching GIFs in the current folder.
)

echo.
choice /C YN /M "Do you want to proceed?"

if errorlevel 2 (
    echo.
    echo Operation cancelled.
    pause
    exit
)

echo.
echo Starting process...
echo.

powershell -Command ^
    $dir = '%target_dir%'; ^
    $files = Get-ChildItem -Path $dir -Filter *.gif; ^
    if ($files.Count -eq 0) { Write-Host 'No GIFs found to patch.' -ForegroundColor Yellow; exit }; ^
    $outPathBase = if ($dir -eq 'workshop_output') { Join-Path $dir 'patched_gifs' } else { 'patched_output' }; ^
    $outDir = New-Item -ItemType Directory -Force -Path $outPathBase; ^
    foreach ($file in $files) { ^
        try { ^
            $bytes = [System.IO.File]::ReadAllBytes($file.FullName); ^
            if ($bytes[-1] -eq 0x3B) { ^
                $bytes[-1] = 0x21; ^
                $newName = $file.BaseName + '_patched' + $file.Extension; ^
                $finalPath = Join-Path $outDir.FullName $newName; ^
                [System.IO.File]::WriteAllBytes($finalPath, $bytes); ^
                Write-Host \"[OK] Patched: $($file.Name) -> $($outPathBase)\$newName\" -ForegroundColor Green; ^
            } ^
        } catch { ^
            Write-Host \"[ERROR] Could not process $($file.Name)\" -ForegroundColor Red; ^
        } ^
    }; ^
    Write-Host \"`n--- Done! Your files are in: $($outDir.FullName) ---\" -ForegroundColor White

pause