Write-Host "Starting File Automation Script..." -ForegroundColor Cyan

$cutoffDate = (Get-Date).AddDays(0)
Write-Host "Looking for files modified on or before: $cutoffDate"

$filesToProcess = Get-ChildItem -Path . | Where-Object { $_.LastWriteTime -le $cutoffDate -and $_.Extension -ne ".ps1" }

foreach ($file in $filesToProcess) {
    Write-Host "Found file to process: $($file.Name)" -ForegroundColor Yellow
}

Write-Host "Simulating move operation using -WhatIf..." -ForegroundColor Green
Move-Item -Path "test1.txt" -Destination "." -WhatIf

Write-Host "File automation script completed successfully!" -ForegroundColor Cyan