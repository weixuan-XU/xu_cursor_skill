# Install every skill in skills/ for Cursor, Claude Code, and Codex (user scope).
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$src = Join-Path $root "skills"
if (-not (Test-Path $src)) { throw "Missing skills directory: $src" }

$homeDir = $env:USERPROFILE
$targets = @(
    (Join-Path $homeDir ".cursor\skills"),
    (Join-Path $homeDir ".claude\skills"),
    (Join-Path $homeDir ".agents\skills")
)

foreach ($destRoot in $targets) {
    New-Item -ItemType Directory -Path $destRoot -Force | Out-Null
    Get-ChildItem $src -Directory | ForEach-Object {
        $dest = Join-Path $destRoot $_.Name
        if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
        Copy-Item $_.FullName $dest -Recurse -Force
        Write-Host "installed $($_.Name) -> $dest"
    }
}

Write-Host ""
Write-Host "Done. Restart Cursor, Claude Code, or Codex if a skill list was already open."
