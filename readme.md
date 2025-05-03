
# PSX Multi-Disc Organizer & `.m3u` Generator

This PowerShell script helps organize multi-disc PlayStation CHD games. It:

- Scans the `G:\roms\psx` folder for multi-disc `.chd` files (e.g. `Game (Disc 1).chd`, `Game (Disc 2).chd`)
- Moves them into a `multi\` subfolder
- Creates an `.m3u` playlist in the root folder referencing those discs
- Skips `.m3u` creation if the playlist already exists

---

## 📁 Folder Structure Before

```
G:\roms\psx
├── Final Fantasy IX (USA) (Disc 1).chd
├── Final Fantasy IX (USA) (Disc 2).chd
├── ...
```

## 📁 Folder Structure After

```
G:\roms\psx
├── Final Fantasy IX (USA).m3u
├── multi
│ ├── Final Fantasy IX (USA) (Disc 1).chd
│ ├── Final Fantasy IX (USA) (Disc 2).chd

```


---

## 🚀 How to Use

1. Place the script `Generate-M3U.ps1` in your `G:\roms\psx` folder.

2. Open **PowerShell** as Administrator or with execution rights.

3. Run the script with:

```powershell
cd G:\roms\psx
powershell -ExecutionPolicy Bypass -File .\Generate-M3U.ps1
```
---
# 💡 Notes
The script checks for existing .m3u files and will not overwrite them.

It only targets .chd files with names matching (Disc N) format.

Ensure your disc files are named consistently (e.g. with proper (Disc 1), (Disc 2) suffixes).

---
# 📄 Example of Generated .m3u File
```
multi\Final Fantasy IX (USA) (Disc 1).chd
multi\Final Fantasy IX (USA) (Disc 2).chd
multi\Final Fantasy IX (USA) (Disc 3).chd
multi\Final Fantasy IX (USA) (Disc 4).chd
```

# 🛠 Requirements
 - PowerShell 2.0 or later
 - .chd files must be in the G:\roms\psx folder