# Mirror skills/ into the directories Claude Code and Codex actually scan.
# Source of truth: skills/<name>/
#   .agents/skills/  Codex, Cursor
#   .claude/skills/  Claude Code (Cursor also reads this)
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$src = Join-Path $root "skills"
if (-not (Test-Path $src)) { throw "Missing skills directory: $src" }

$targets = @(".agents/skills", ".claude/skills")
foreach ($rel in $targets) {
    $destRoot = Join-Path $root ($rel -replace "/", "\")
    if (Test-Path $destRoot) { Remove-Item $destRoot -Recurse -Force }
    New-Item -ItemType Directory -Path $destRoot -Force | Out-Null
    Get-ChildItem $src -Directory | ForEach-Object {
        Copy-Item $_.FullName (Join-Path $destRoot $_.Name) -Recurse -Force
        Write-Host "synced $($_.Name) -> $rel/$($_.Name)"
    }
}
