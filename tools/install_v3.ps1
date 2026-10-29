[CmdletBinding(SupportsShouldProcess)]
param([string]$GameRoot = $env:GTA_SA_DIR)
$ErrorActionPreference = 'Stop'
$sourceRoot = Split-Path -Parent $PSScriptRoot
if (!$GameRoot) { throw 'Set GTA_SA_DIR or pass -GameRoot.' }
$gameRoot = (Resolve-Path -LiteralPath $GameRoot).Path
$backupRoot = Join-Path $sourceRoot ('.local\backups\install-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))
$gameFiles = @{
    'bin\GTA-SA\Release\McpServer.SA.asi' = 'McpServer.SA.asi'
    'moonloader\mcp_bridge.lua' = 'moonloader\mcp_bridge.lua'
    'moonloader\lib\mcp_runner.lua' = 'moonloader\lib\mcp_runner.lua'
    'moonloader\examples\mcp_debug_probe.lua' = 'mcp_scripts\mcp_debug_probe.lua'
    'moonloader\examples\mcp_execution_test.lua' = 'mcp_scripts\mcp_execution_test.lua'
}
foreach ($relative in $gameFiles.Keys) {
    if (!(Test-Path -LiteralPath (Join-Path $sourceRoot $relative))) {
        throw "Missing package file: $relative. Build the project first."
    }
}
if (!$WhatIfPreference -and (Get-Process gta_sa -ErrorAction SilentlyContinue)) {
    throw 'Close GTA before replacing the ASI.'
}
foreach ($relative in $gameFiles.Keys) {
    $outputPath = Join-Path $gameRoot $gameFiles[$relative]
    if (!$PSCmdlet.ShouldProcess($outputPath, 'Back up and install protocol v3 file')) { continue }
    if (Test-Path -LiteralPath $outputPath) {
        $backupPath = Join-Path $backupRoot ('game\' + $gameFiles[$relative])
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $backupPath) | Out-Null
        Copy-Item -LiteralPath $outputPath -Destination $backupPath
    }
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $outputPath) | Out-Null
    Copy-Item -LiteralPath (Join-Path $sourceRoot $relative) -Destination $outputPath
}
if (!$WhatIfPreference) { Write-Output "Installed protocol v3. Backup: $backupRoot" }
