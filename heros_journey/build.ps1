# Get the directory where this script is located
$pack_loc = $PSScriptRoot

# Set the pack name
$pack_name = "HerosJourney"
$xml_file = Join-Path $pack_loc "$pack_name.xml"
$data_folder = Join-Path $pack_loc "Data"
$zip_path = Join-Path $pack_loc "$pack_name.zip"
$taco_path = Join-Path $pack_loc "$pack_name.taco"

# Delete existing .taco file
if (Test-Path $taco_path) {
    Remove-Item $taco_path -Force
}

# Delete existing .zip file
if (Test-Path $zip_path) {
    Remove-Item $zip_path -Force
}

# Check if required input files exist
if (-Not (Test-Path $xml_file)) {
    Write-Error "Missing XML file: $xml_file"
    exit 1
}
if (-Not (Test-Path $data_folder)) {
    Write-Error "Missing Data folder: $data_folder"
    exit 1
}

# Create the ZIP archive
Compress-Archive -Path $data_folder, $xml_file -DestinationPath $zip_path

# Wait until zip is fully written (optional but safe)
Start-Sleep -Seconds 1

# Rename to .taco if the ZIP was successfully created
if (Test-Path $zip_path) {
    Rename-Item -Path $zip_path -NewName "$pack_name.taco"
} else {
    Write-Error "ZIP archive was not created."
}