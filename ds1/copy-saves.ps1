# copy-saves.ps1 - copy Dark Souls Remastered save files into this repo folder.
# PowerShell 5.1 compatible. Dry run: -WhatIf. Skip vanilla save: -SkipVanilla.

[CmdletBinding()]
param(
    [string]$SaveDir = 'C:\Users\adabs\Documents\NBGI\DARK SOULS REMASTERED\26412371',
    [string]$DestDir = '',
    [switch]$SkipVanilla
)

$ErrorActionPreference = 'Stop'

if (-not $DestDir) {
    $here = Split-Path -Parent $MyInvocation.MyCommand.Path
    $DestDir = Join-Path $here 'mlg-sorcerer-greatsword-26412371'
}

if (Get-Process -Name 'DarkSoulsRemastered' -ErrorAction SilentlyContinue) {
    Write-Warning 'Dark Souls Remastered is running - exit the game first or the copy may be stale.'
}

if (-not (Test-Path -LiteralPath $SaveDir)) {
    throw "Save directory not found: $SaveDir"
}
if (-not (Test-Path -LiteralPath $DestDir)) {
    New-Item -ItemType Directory -Path $DestDir -Force | Out-Null
}

$files = @('DRAKS0005.co2', 'steam_autocloud.vdf')
if (-not $SkipVanilla) { $files = @('DRAKS0005.sl2') + $files }

$copied = 0
foreach ($name in $files) {
    $src = Join-Path $SaveDir $name
    if (-not (Test-Path -LiteralPath $src)) {
        Write-Warning "Missing, skipped: $name"
        continue
    }
    $dst = Join-Path $DestDir $name
    Copy-Item -LiteralPath $src -Destination $dst -Force
    $h1 = (Get-FileHash -LiteralPath $src -Algorithm SHA256).Hash
    $h2 = (Get-FileHash -LiteralPath $dst -Algorithm SHA256).Hash
    if ($h1 -ne $h2) { throw "Hash mismatch after copy: $name" }
    Write-Host ("copied {0} ({1} bytes) sha256={2}" -f $name, (Get-Item -LiteralPath $dst).Length, $h2.Substring(0, 16))
    $copied++
}

Write-Host ("done: {0} file(s) -> {1}" -f $copied, $DestDir)
