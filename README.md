# ⚙️ dotfiles

Repository kumpulan file konfigurasi (dotfiles) pribadi milik [@rianabd01](https://github.com/rianabd01).

Struktur repository ini dirancang modular berdasarkan **Sistem Operasi (OS)** agar rapi dan mudah diekspansi jika menggunakan OS lain di masa depan.

---

## 📁 Struktur Direktori

```text
dotfiles/
├── windows/                     # Konfigurasi khusus sistem operasi Windows
│   ├── alacritty/
│   │   ├── alacritty.toml      # Konfigurasi tema One Dark, padding, dan font Alacritty
│   │   ├── cmd.ico
│   │   └── Terminal.ico
│   └── zed/
│       ├── settings.json       # Pengaturan editor Zed (tema Catppuccin, AI agent, model)
│       └── AGENTS.md           # Prompt pedoman behavioral & coding guidelines untuk Zed Agent
├── scripts/
│   └── install-windows.ps1     # Script otomatis untuk menghubungkan config ke AppData di Windows
├── .gitignore
└── README.md
```

---

## 🚀 Cara Setup / Restore di Windows Baru

1. **Clone repository ini** ke folder home user (`C:\Users\<username>\dotfiles`):
   ```powershell
   git clone https://github.com/rianabd01/dotfiles.git $HOME\dotfiles
   ```

2. **Jalankan script instalasi PowerShell**:
   ```powershell
   powershell -ExecutionPolicy Bypass -File "$HOME\dotfiles\scripts\install-windows.ps1"
   ```

Script di atas akan secara otomatis menghubungkan file konfigurasi dari repository ke folder target di `%APPDATA%`:
- `%APPDATA%\alacritty` $\rightarrow$ `dotfiles\windows\alacritty` *(via Directory Junction)*
- `%APPDATA%\Zed\settings.json` $\rightarrow$ `dotfiles\windows\zed\settings.json` *(via HardLink)*
- `%APPDATA%\Zed\AGENTS.md` $\rightarrow$ `dotfiles\windows\zed\AGENTS.md` *(via HardLink)*

---

## 🔄 Cara Update / Sinkronisasi ke GitHub

Karena file konfigurasi sudah terhubung langsung (linked) dengan folder `dotfiles`, setiap perubahan yang kamu lakukan di dalam Zed atau Alacritty akan langsung terdeteksi oleh Git:

```powershell
cd $HOME\dotfiles
git status
git add .
git commit -m "feat(zed): update agent model settings"
git push
```
