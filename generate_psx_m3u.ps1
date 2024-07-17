# PowerShell script to generate .m3u playlist files for each .chd file that includes "(Disc" in its name,
# and move those files to a hidden folder named .multidisc
# Usage: Copy this script to the working directory and execute.

# Create the hidden folder if it doesn't exist
$hiddenFolder = ".multidisc"
if (-Not (Test-Path $hiddenFolder)) {
    New-Item -ItemType Directory -Path $hiddenFolder -Force | Out-Null
    # Set the folder attribute to hidden
    (Get-Item $hiddenFolder).Attributes += [System.IO.FileAttributes]::Hidden
}

Get-ChildItem -Filter "*.chd" | Where-Object { $_.Name -match "\(Disc" } | ForEach-Object {
    $title = $_.Name -replace '\.chd', '' -replace ' \(Disc..\)', '' -replace ' Disc..*$', '' -replace ' \(.*'
    $hiddenPath = ".multidisc\$($_.Name)"
    Add-Content -Path "$title.m3u" -Value $hiddenPath

    # Move the .chd file to the .multidisc folder
    Move-Item -Path $_.FullName -Destination $hiddenFolder
}
