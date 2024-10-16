$factorioSavePath = Join-Path -Path $env:USERPROFILE -ChildPath '\AppData\Roaming\Factorio'
$blueprintFilePath = Join-Path -Path $factorioSavePath -ChildPath 'blueprint-storage.dat'
$timeStamp = Get-Date -Format 'yyyy-MM-dd_HHmmss'
$backupPath = Join-Path -Path $factorioSavePath -ChildPath 'blueprint-backups'

if (!(Test-Path -Path $backupPath)){
    New-Item -Path $backupPath -ItemType 'directory' -Force
}

if (Test-Path -Path $blueprintFilePath) {
    New-Item -Path $backupPath -Name $timeStamp -ItemType 'directory' -Force
    $backupDestination = Join-Path -Path $backupPath -ChildPath $timeStamp
    Copy-Item -Path $blueprintFilePath -Destination $backupDestination -Force
}

Get-ChildItem -Path $backupPath -Directory | Sort-Object Name -Descending | Select-Object -Skip 10 | Remove-Item -Recurse -Force
