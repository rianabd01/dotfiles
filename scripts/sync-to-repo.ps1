# sync-to-repo.ps1
# Script untuk menyalin konfigurasi lokal Windows ke dalam repository dotfiles

$ErrorActionPreference = "Stop"

$dotfilesDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$appData = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::ApplicationData)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Sync Configs -> Dotfiles Repo          " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# 1. Alacritty
$alacrittySrc = Join-Path $appData "alacritty"
$alacrittyDest = Join-Path $dotfilesDir "shared\alacritty"

if (Test-Path $alacrittySrc) {
    Copy-Item -Path "$alacrittySrc\*" -Destination $alacrittyDest -Recurse -Force
    Write-Host "  ✓ Alacritty config berhasil disalin ke repo!" -ForegroundColor Green
}

# 2. Zed
$zedSrc = Join-Path $appData "Zed"
$zedDest = Join-Path $dotfilesDir "shared\zed"

if (Test-Path $zedSrc) {
    if (Test-Path "$zedSrc\settings.json") {
        Copy-Item -Path "$zedSrc\settings.json" -Destination "$zedDest\settings.json" -Force
    }
    if (Test-Path "$zedSrc\AGENTS.md") {
        Copy-Item -Path "$zedSrc\AGENTS.md" -Destination "$zedDest\AGENTS.md" -Force
    }
    if (Test-Path "$zedSrc\keymap.json") {
        Copy-Item -Path "$zedSrc\keymap.json" -Destination "$zedDest\keymap.json" -Force
    }
    Write-Host "  ✓ Zed config berhasil disalin ke repo!" -ForegroundColor Green
}

Write-Host ""
Write-Host "Selesai! Konfigurasi terbaru sudah disalin ke folder dotfiles." -ForegroundColor Green
Write-Host "Tinggal lakukan: git add . && git commit -m 'update' && git push" -ForegroundColor Yellow
