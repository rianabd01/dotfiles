# 🌐 dotfiles (Cross-Platform)

Repository kumpulan file konfigurasi (dotfiles) pribadi milik [@rianabd01](https://github.com/rianabd01).

Dirancang dengan arsitektur **Shared OS** (cross-platform) sehingga konfigurasi yang sama dapat digunakan bersama secara konsisten di **Windows**, **Linux**, maupun **macOS**.

---

## 📁 Struktur Direktori

```text
dotfiles/
├── shared/                      # 🌐 Konfigurasi utama yang dipakai bersama (Semua OS)
│   ├── alacritty/
│   │   ├── alacritty.toml      # Konfigurasi Alacritty (tema One Dark, padding, colors)
│   │   ├── cmd.ico
│   │   └── Terminal.ico
│   └── zed/
│       ├── settings.json       # Pengaturan editor Zed (tema Catppuccin, 9Router, tools)
│       └── AGENTS.md           # Prompt pedoman behavioral & coding guidelines untuk Zed Agent
│
├── scripts/                     # 🛠️ Script installer / linker per OS
│   ├── install-windows.ps1     # Linking untuk Windows (Junction & HardLink ke %APPDATA%)
│   ├── install-linux.sh        # Symlinking untuk Linux (ke ~/.config)
│   └── install-macos.sh        # Symlinking untuk macOS (ke ~/.config)
│
├── .gitignore
└── README.md
```

---

## 🚀 Cara Setup / Restore Berdasarkan OS

Clone repository ini ke folder home user:
```bash
git clone https://github.com/rianabd01/dotfiles.git $HOME/dotfiles
```

### 🪟 Windows
Buka PowerShell dan jalankan:
```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\dotfiles\scripts\install-windows.ps1"
```
*Script ini akan membuat Junction untuk `%APPDATA%\alacritty` dan HardLink untuk file Zed.*

### 🐧 Linux
Buka terminal dan jalankan:
```bash
chmod +x ~/dotfiles/scripts/install-linux.sh
~/dotfiles/scripts/install-linux.sh
```
*Script ini akan membuat Symlink ke `~/.config/alacritty` dan `~/.config/zed`.*

### 🍎 macOS
Buka terminal dan jalankan:
```bash
chmod +x ~/dotfiles/scripts/install-macos.sh
~/dotfiles/scripts/install-macos.sh
```
*Script ini akan membuat Symlink ke `~/.config/alacritty` dan `~/.config/zed`.*

---

## 🔄 Cara Update / Sinkronisasi ke GitHub

Karena file konfigurasi di setiap OS terhubung secara langsung (linked / symlinked), setiap perubahan yang kamu simpan di aplikasi (misalnya mengubah tema atau model AI di Zed) akan langsung terdeteksi oleh Git:

```bash
cd ~/dotfiles   # atau cd $HOME\dotfiles di Windows
git status
git add .
git commit -m "feat(zed): update agent model settings"
git push
```

Di komputer/OS kamu yang lain, cukup lakukan:
```bash
cd ~/dotfiles
git pull
```
Konfigurasi di komputer tersebut akan langsung ter-update secara otomatis!
