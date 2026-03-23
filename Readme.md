---

<h1 align="center">🎮 Steam Artwork GIF Hex Patcher & Workshop Splitter</h1>

<p align="center">
  <strong>A dual-utility suite to automate Workshop splitting and Hex patcher for Steam Profile GIF Artworks.</strong></strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows-blue?style=for-the-badge&logo=windows" alt="Windows">
  <img src="https://img.shields.io/badge/Language-Batch%20%2F%20PowerShell-orange?style=for-the-badge" alt="Language">
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License">
</p>

---

## 📖 <big>Overview</big>

<p align="justify">
Bypass Steam's strict upload restrictions for Workshop and Artwork showcases. This repository provides two specialized tools: one for <b>frame-perfect splitting</b> of Workshop animations and another for the <b>Hex Patcher</b> trick to enable "infinite" height artworks.
</p>

> [!TIP]
> This tool automates that tedious process for multiple files at once, eliminating the need for manual hex editors.

---

## ✨ <big>The Tools</big>

### 1️⃣ Workshop Splitter (`WorkshopSplitter.bat`)
* **Automatic Resizing:** Scales your GIF to **800x450** resolution.
* **5-Way Split:** Perfectly crops your GIF into 5 segments (158px width) with the exact 2px margins required for a seamless Steam Workshop look.
* *Note: Requires `ffmpeg.exe` in the folder.*

### 2️⃣ Steam Artwork GHP (`SteamArtworkGHP.bat`)
* **The "Hex Trick":** Automatically changes the final byte from `0x3B` to `0x21`.
* **Context Aware:** If it detects a `workshop_output` folder, it patches those files automatically. Otherwise, it patches GIFs in the current directory.
* **Non-Destructive:** Saves final versions to a `patched_gifs` subfolder.

---

## 🚀 <big>How to Use</big>

To ensure the best quality under Steam's **5MB limit**, follow these steps:

1.  **Split:** Run `WorkshopSplitter.bat` to generate the 5 raw segments in the `/workshop_output` folder.
2.  **Optimize:** If any of your gifs are over 5 MB, take those GIFs to an optimizer (like [Ezgif](https://ezgif.com/optimize)) to ensure each is under 5MB. 
3.  **Patch:** Run `SteamArtworkGHP.bat`. It will detect your files and apply the Hex patch.
4.  **Upload:** Use the browser console scripts below to upload the gifs to your Steam.

---


### 🛠️ Steam Console Scripts
To bypass the upload validation, paste the corresponding code into your browser console (`F12` > Console) **while** on the Steam upload page and **before** clicking `Save and Continue`:
<br>
<a href="https://steamcommunity.com/sharedfiles/edititem/767/3/" target="_blank">🚀 Open Steam Upload Page</a>

**For Long Artwork Showcase:**
```javascript
$J('#image_width').val(1000).attr('id',''),$J('#image_height').val(1).attr('id','');
```
**For Long Workshop Showcases:**
```javascript
$J('[name=consumer_app_id]').val(480);$J('[name=file_type]').val(0);$J('[name=visibility]').val(0);
```
**For Long Guides:**
```javascript
$J('[name=consumer_app_id]').val(480);$J('[name=file_type]').val(9);$J('[name=visibility]').val(0);
```

---

##  ⚙️ Technical Requirements

  OS: Windows 10 or 11.

  FFmpeg: WorkshopSplitter.bat requires ffmpeg.exe to be present in the same folder.

  Native Tools: Uses PowerShell (integrated into Windows) for binary file manipulation.
  
---
