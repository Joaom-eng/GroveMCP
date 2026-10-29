param(
    [string]$GameRoot = $env:GTA_SA_DIR,
    [string]$Python = '',
    [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot)
)
$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path
$localSettings = Join-Path $projectRoot '.local\paths.psd1'
if (Test-Path -LiteralPath $localSettings) {
    $settings = Import-PowerShellDataFile -LiteralPath $localSettings
    if (!$GameRoot) { $GameRoot = $settings.GameRoot }
    if (!$Python) { $Python = $settings.Python }
}
if (!$GameRoot) { throw 'Set GTA_SA_DIR or pass -GameRoot with the GTA installation folder.' }
if (!$Python) {
    $Python = (Get-Command py -ErrorAction SilentlyContinue).Source
    if (!$Python) { $Python = (Get-Command python -ErrorAction Stop).Source }
}
$GameRoot = (Resolve-Path -LiteralPath $GameRoot).Path
$mailbox = Join-Path $GameRoot 'mcp_scripts\chat'
$relayPath = Join-Path $PSScriptRoot 'ingame_chat_relay.py'
$codexPath = (Get-Command codex -ErrorAction Stop).Source
New-Item -ItemType Directory -Force -Path $mailbox | Out-Null
$statusPath = Join-Path $mailbox 'status.json'
if (Test-Path -LiteralPath $statusPath) {
    $relayStatus = Get-Content -Raw -LiteralPath $statusPath | ConvertFrom-Json
    $currentSeconds = [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
    if ($currentSeconds - $relayStatus.heartbeat -lt 6 -and (Get-Process -Id $relayStatus.pid -ErrorAction SilentlyContinue)) {
        Write-Output "Chat relay already running, PID $($relayStatus.pid)"
        exit 0
    }
}
$arguments = @('"' + $relayPath + '"', '--mailbox', '"' + $mailbox + '"',
    '--project', '"' + $projectRoot + '"', '--codex', '"' + $codexPath + '"')
$relayProcess = Start-Process -FilePath $Python -ArgumentList $arguments -WorkingDirectory $projectRoot `
    -WindowStyle Hidden -RedirectStandardOutput (Join-Path $mailbox 'relay-output.log') `
    -RedirectStandardError (Join-Path $mailbox 'relay-errors.log') -PassThru
Write-Output "Chat relay started, PID $($relayProcess.Id). F7 opens the in-game panel."
