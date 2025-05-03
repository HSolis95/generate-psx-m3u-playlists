# Base paths
$psxPath = "G:\roms\psx"
$multiPath = Join-Path $psxPath "multi"

# Create the 'multi' folder if it doesn't exist
if (!(Test-Path $multiPath)) {
    New-Item -ItemType Directory -Path $multiPath | Out-Null
}

# Find .chd files that match the pattern for multi-disc (e.g., "(Disc 1)", "(Disc 2)")
$multiDiscFiles = Get-ChildItem $psxPath -Filter *.chd | Where-Object { $_.BaseName -match "\(Disc \d+\)" }

# Group files by their base name (excluding " (Disc N)" part)
$groups = $multiDiscFiles | Group-Object { $_.BaseName -replace '\s+\(Disc \d+\)$', '' }

foreach ($group in $groups) {
    $baseName = $group.Name
    $m3uPath = Join-Path $psxPath "$baseName.m3u"

    # Skip if .m3u file already exists
    if (Test-Path $m3uPath) {
        Write-Host "Skipped (already exists): $baseName.m3u"
        continue
    }

    # Move each disc file to the 'multi' folder if it's not already there
    $lines = $group.Group | Sort-Object Name | ForEach-Object {
        $newPath = Join-Path $multiPath $_.Name
        if ($_.DirectoryName -ne $multiPath) {
            Move-Item $_.FullName -Destination $multiPath
        }
        "multi\$($_.Name)"
    }

    # Create the .m3u playlist file pointing to the files in 'multi'
    $lines | Out-File -FilePath $m3uPath -Encoding UTF8
    Write-Host "Created and moved: $baseName.m3u"
}
