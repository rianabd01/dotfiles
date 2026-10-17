# install-windows.ps1
# Script instalasi dan linking konfigurasi dotfiles untuk Windows

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

Write-Host "[1/2] Linking Alacritty..." -ForegroundColor Yellow
if (Test-Path $alacrittyDest) {
    $item = Get-Item $alacrittyDest
    if ($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
        cmd /c rmdir "$alacrittyDest"
    } else {
        $backup = "$alacrittyDest.bak"
        Write-Host "  Membuat backup ke $backup..." -ForegroundColor Gray
        Move-Item $alacrittyDest $backup -Force
    }
}
New-Item -ItemType Junction -Path $alacrittyDest -Target $alacrittySource | Out-Null
Write-Host "  ✓ Alacritty berhasil dihubungkan via Directory Junction!" -ForegroundColor Green

# 2. Zed
$zedSource = Join-Path $dotfilesDir "shared\zed"
$zedDest = Join-Path $appData "Zed"

Write-Host "[2/2] Linking Zed..." -ForegroundColor Yellow
if (Test-Path $zedDest) {
    $item = Get-Item $zedDest
    if ($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
        cmd /c rmdir "$zedDest"
    } else {
        $backup = "$zedDest.bak"
        Write-Host "  Membuat backup ke $backup..." -ForegroundColor Gray
        Move-Item $zedDest $backup -Force
    }
}
New-Item -ItemType Junction -Path $zedDest -Target $zedSource | Out-Null
Write-Host "  ✓ Zed berhasil dihubungkan via Directory Junction!" -ForegroundColor Green

Write-Host ""
Write-Host "Selesai! Konfigurasi Windows telah terhubung dengan dotfiles repo." -ForegroundColor Green
