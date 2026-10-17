# install-windows.ps1
# Script instalasi dan penyalinan konfigurasi dotfiles untuk Windows

$ErrorActionPreference = "Stop"

$dotfilesDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$appData = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::ApplicationData)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Dotfiles Installer (Windows OS)        " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Dotfiles Root: $dotfilesDir"
Write-Host "AppData Path : $appData"
Write-Host ""

# 1. Alacritty
$alacrittySource = Join-Path $dotfilesDir "shared\alacritty"
$alacrittyDest = Join-Path $appData "alacritty"

Write-Host "[1/2] Menyalin Alacritty..." -ForegroundColor Yellow
if (-not (Test-Path $alacrittyDest)) {
    New-Item -ItemType Directory -Path $alacrittyDest -Force | Out-Null
}
Copy-Item -Path "$alacrittySource\*" -Destination $alacrittyDest -Recurse -Force
Write-Host "  ✓ Alacritty config berhasil disalin ke $alacrittyDest!" -ForegroundColor Green

# 2. Zed
$zedSource = Join-Path $dotfilesDir "shared\zed"
$zedDest = Join-Path $appData "Zed"

Write-Host "[2/2] Menyalin Zed..." -ForegroundColor Yellow
if (-not (Test-Path $zedDest)) {
    New-Item -ItemType Directory -Path $zedDest -Force | Out-Null
}
Copy-Item -Path "$zedSource\*" -Destination $zedDest -Recurse -Force
Write-Host "  ✓ Zed config berhasil disalin ke $zedDest!" -ForegroundColor Green

Write-Host ""
Write-Host "Selesai! Konfigurasi Windows telah berhasil disalin dari dotfiles repo." -ForegroundColor Green
