<p align="center">
  <img src="https://socialify.git.ci/YOUR_GITHUB_USERNAME/Steam-Artwork-GIF-Hex-Patcher/image?font=Inter&language=1&name=1&owner=1&pattern=Circuit%20Board&theme=Dark" alt="Steam-Artwork-GIF-Hex-Patcher" width="640" height="320" />
</p>

---

<h1 align="center">🎮 Steam Artwork GIF Hex Patcher</h1>

<p align="center">
  <strong>A lightweight, zero-dependency Windows utility to automate the "Hex Trick" for Steam Artworks.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows-blue?style=for-the-badge&logo=windows" alt="Windows">
  <img src="https://img.shields.io/badge/Language-Batch%20%2F%20PowerShell-orange?style=for-the-badge" alt="Language">
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License">
</p>

---

## 📖 <big>Overview</big>

<p align="justify">
When uploading GIFs to Steam profiles, the platform often enforces strict aspect ratio and height limits. By modifying the final byte of a GIF file from <code>0x3B</code> (the standard GIF trailer) to <code>0x21</code> (an extension block), you can bypass these restrictions to create <b>"infinite" or long-format artworks</b>.
</p>

> [!TIP]
> This tool automates that tedious process for multiple files at once, eliminating the need for manual hex editors.

---

## ✨ <big>Features</big>

* 🚀 **No Installation Required:** Uses a Batch-PowerShell hybrid that runs natively on Windows 10/11.
* 📦 **Batch Processing:** Patches all GIFs in a folder simultaneously.
* 🛡️ **Non-Destructive:** Creates an `/output` folder so your original files remain untouched.
* 🏷️ **Automatic Renaming:** Adds a `_hex` suffix to processed files for easy identification.

---

## 🚀 <big>How to Use</big>

1.  **Download** the `Steamartwork_patcher.bat` file.
2.  **Place** it into the folder containing your exported GIFs.
3.  **Run** the file by double-clicking it.
4.  The script includes a safety prompt. Simply press **Y** to start or **N** to cancel 
5.  Your patched GIFs will be ready in the newly created `output` folder.
6.  Upload to Steam using the corresponding browser console script (READ BELOW). 

### 🛠️ Steam Console Scripts
To bypass the upload validation, paste the corresponding code into your browser console (`F12` > Console) while on the Steam upload page:
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

##  ⚙️ <big>Technical Details</big>

The script reads the binary data of the GIF. In the GIF89a specification, `0x3B` marks the end of the file. By changing it to `0x21`, the Steam upload validator ignores certain dimension checks while the browser still renders the GIF correctly.

**Built with:**
- Windows Batch
- PowerShell Core (Natively integrated)
---
