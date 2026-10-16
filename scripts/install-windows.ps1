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
if (-not (Test-Path $zedDest)) {
    New-Item -ItemType Directory -Path $zedDest -Force | Out-Null
}

$filesToLink = @("settings.json", "AGENTS.md")
foreach ($file in $filesToLink) {
    $srcFile = Join-Path $zedSource $file
    $destFile = Join-Path $zedDest $file
    
    if (Test-Path $srcFile) {
        if (Test-Path $destFile) {
            Remove-Item $destFile -Force
        }
        New-Item -ItemType HardLink -Path $destFile -Target $srcFile | Out-Null
        Write-Host "  ✓ $file berhasil dihubungkan via HardLink!" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "Selesai! Konfigurasi Windows telah terhubung dengan dotfiles repo." -ForegroundColor Green
