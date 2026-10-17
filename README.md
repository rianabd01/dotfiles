# 🌐 dotfiles (Cross-Platform)

Repository kumpulan file konfigurasi (dotfiles) pribadi milik [@rianabd01](https://github.com/rianabd01).

Dirancang modular dan mandiri (tanpa linking real-time) agar konfigurasi lokal di komputer tetap independen, aman, dan dapat disinkronkan ke Git kapan pun dibutuhkan.

---

## 📁 Struktur Direktori

```text
dotfiles/
├── shared/                      # 🌐 File konfigurasi
│   ├── alacritty/
│   │   ├── alacritty.toml      # Konfigurasi Alacritty (tema One Dark, padding, font)
│   │   ├── cmd.ico
│   │   └── Terminal.ico
│   └── zed/
│       ├── settings.json       # Pengaturan editor Zed (Catppuccin Mocha, 3270 font, model AI)
│       └── AGENTS.md           # Prompt pedoman behavioral & coding guidelines untuk Zed Agent
│
├── scripts/                     # 🛠️ Script utilitas
│   ├── sync-to-repo.ps1        # Salin config dari AppData Windows ke repo dotfiles
│   ├── install-windows.ps1     # Terapkan config dari repo ke AppData Windows
│   ├── install-linux.sh        # Terapkan config untuk Linux (~/.config)
│   └── install-macos.sh        # Terapkan config untuk macOS (~/.config)
│
├── .gitignore
└── README.md
```

---

## 🔄 Cara Menyimpan Perubahan Lokal ke GitHub

Ketika kamu selesai mengubah setting di Zed atau Alacritty dan ingin menyimpannya ke GitHub:

1. **Jalankan script sync ke repo**:
   ```powershell
   powershell -ExecutionPolicy Bypass -File "$HOME\dotfiles\scripts\sync-to-repo.ps1"
   ```

2. **Commit dan Push ke Git**:
   ```powershell
   cd $HOME\dotfiles
   git status
   git add .
   git commit -m "update zed and alacritty configs"
   git push
   ```

---

## 🚀 Cara Setup / Pasang di Komputer Baru

Clone repository ini ke folder home:
```bash
git clone https://github.com/rianabd01/dotfiles.git $HOME/dotfiles
```

- **Windows**:
  ```powershell
  powershell -ExecutionPolicy Bypass -File "$HOME\dotfiles\scripts\install-windows.ps1"
  ```
- **Linux**:
  ```bash
  bash ~/dotfiles/scripts/install-linux.sh
  ```
- **macOS**:
  ```bash
  bash ~/dotfiles/scripts/install-macos.sh
  ```
