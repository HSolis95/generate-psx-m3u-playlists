
# PSX Multi-Disc Organizer & `.m3u` Generator

## Windows Version
This PowerShell script helps organize multi-disc PlayStation CHD games. It:

- Scans the `G:\roms\psx` folder for multi-disc `.chd` files (e.g. `Game (Disc 1).chd`, `Game (Disc 2).chd`)
- Moves them into a `multi\` subfolder
- Creates an `.m3u` playlist in the root folder referencing those discs
- Skips `.m3u` creation if the playlist already exists

---

### 📁 Folder Structure Before

```
G:\roms\psx
├── Final Fantasy IX (USA) (Disc 1).chd
├── Final Fantasy IX (USA) (Disc 2).chd
├── ...
```

### 📁 Folder Structure After

```
G:\roms\psx
├── Final Fantasy IX (USA).m3u
├── multi
│ ├── Final Fantasy IX (USA) (Disc 1).chd
│ ├── Final Fantasy IX (USA) (Disc 2).chd

```

---

### 🚀 How to Use

1. Place the script `Generate-M3U.ps1` in your `G:\roms\psx` folder.

2. Open **PowerShell** as Administrator or with execution rights.

3. Run the script with:

```powershell
cd G:\roms\psx
powershell -ExecutionPolicy Bypass -File .\Generate-M3U.ps1
```
---
### 💡 Notes
The script checks for existing .m3u files and will not overwrite them.

It only targets .chd files with names matching (Disc N) format.

Ensure your disc files are named consistently (e.g. with proper (Disc 1), (Disc 2) suffixes).

---
### 📄 Example of Generated .m3u File
```
multi\Final Fantasy IX (USA) (Disc 1).chd
multi\Final Fantasy IX (USA) (Disc 2).chd
multi\Final Fantasy IX (USA) (Disc 3).chd
multi\Final Fantasy IX (USA) (Disc 4).chd
```

### 🛠 Requirements
 - PowerShell 2.0 or later
 - .chd files must be in the G:\roms\psx folder



## Linux/Mac Bash Version
 This script scans for multi-disc PlayStation `.chd` files in the current directory, moves them into a `multi/` subdirectory, and generates `.m3u` playlist files that list each disc. It's ideal for organizing games for emulators like DuckStation or RetroArch.

---

### 📁 Folder Structure (Before)
```
./
├── Final Fantasy IX (USA) (Disc 1).chd
├── Final Fantasy IX (USA) (Disc 2).chd
```

### 📁 Folder Structure (After)
```
./
├── Final Fantasy IX (USA).m3u
├── multi/
│ ├── Final Fantasy IX (USA) (Disc 1).chd
│ ├── Final Fantasy IX (USA) (Disc 2).chd
```

---

### ✅ What the Script Does

- Identifies all `.chd` files with a `(Disc N)` suffix in the current folder.
- Groups them by their base name.
- Moves the files into the `multi/` folder.
- Creates a `.m3u` playlist in the root pointing to those discs.
- Skips `.m3u` generation if it already exists.

---

### 🔧 Requirements

- Bash shell (Linux, macOS, or WSL on Windows)
- `find`, `grep`, `sort`, `mv`, `sed` – usually included in any Unix-like system

---

### 🚀 How to Use

1. Copy the script file (`generate_m3u.sh`) into your PSX ROMs folder.
2. Open a terminal and `cd` into that directory.
3. Run the following commands:

```bash
chmod +x generate_m3u.sh
./generate_m3u.sh
```

The script will automatically create the multi/ folder, move the appropriate files, and create one .m3u file per multi-disc game.

### 📝 Example Output of .m3u
```
multi/Final Fantasy IX (USA) (Disc 1).chd
multi/Final Fantasy IX (USA) (Disc 2).chd
multi/Final Fantasy IX (USA) (Disc 3).chd
multi/Final Fantasy IX (USA) (Disc 4).chd
```


# ❗ Notes
Disc names must follow the format Game Title (Disc N).chd.

Existing .m3u files will not be overwritten.

# 📤 Compatible With

- DuckStation
- RetroArch (Beetle PSX / Mednafen)
- Any emulator supporting .m3u multi-disc playlists
