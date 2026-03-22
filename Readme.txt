<p align="center">
  <img src="https://socialify.git.ci/tu-usuario/Steam-Artwork-GIF-Hex-Patcher/image?font=Inter&language=1&name=1&owner=1&pattern=Circuit%20Board&theme=Dark" alt="Steam-Artwork-GIF-Hex-Patcher" width="640" height="320" />
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
Cuando subes GIFs a los perfiles de Steam, la plataforma suele imponer límites estrictos de relación de aspecto y altura. Al modificar el byte final de un archivo GIF de <code>0x3B</code> (el trailer estándar) a <code>0x21</code> (un bloque de extensión), puedes saltarte estas restricciones para crear <b>artworks infinitos o de formato largo</b>.
</p>

> [!TIP]
> Esta herramienta automatiza ese proceso tedioso para múltiples archivos a la vez, eliminando la necesidad de editores hex manuales.

---

## ✨ <big>Features</big>

* 🚀 **No Installation Required:** Corre nativamente en Windows 10/11 mediante un híbrido Batch-PowerShell.
* 📦 **Batch Processing:** Parchea todos los GIFs de una carpeta simultáneamente.
* 🛡️ **Non-Destructive:** Crea una carpeta `/output` para que tus archivos originales estén seguros.
* 🏷️ **Automatic Renaming:** Añade el sufijo `_hex` para identificar fácilmente los archivos listos.

---

## 🚀 <big>How to Use</big>

1.  **Descarga** el archivo `Steamartwork_patcher.bat`.
2.  **Ubícalo** en la carpeta donde tengas tus GIFs exportados.
3.  **Ejecuta** el archivo con doble clic.
4.  Presiona **Y** en la consola para confirmar el inicio.
5.  ¡Listo! Tus archivos parcheados estarán en la carpeta `output`.

### 🛠️ Steam Console Scripts
Para que el truco funcione, usa estos códigos en la consola de tu navegador (`F12` > Console) al subir el archivo:

**Para Workshop Largo:**
```javascript
$J('[name=consumer_app_id]').val(480);$J('[name=file_type]').val(0);$J('[name=visibility]').val(0);
