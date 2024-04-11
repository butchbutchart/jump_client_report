# Define the command to invoke btapi with parameters
$command = ".\btapi --env-file vars.txt list jump-client"

# Execute the command and capture the output
$output = Invoke-Expression -Command $command

# Display the output as an array
Write-Host "Output as array:"
$output

# Get the current date and time
$currentDateTime = Get-Date -Format "yyyyMMdd-HHmmss"

# Define the filename with the current date and time
$csvFileName = "jump_client_report_$currentDateTime.csv"

# Convert the JSON output to PowerShell objects
$jsonObjects = $output | ConvertFrom-Json

# Select the properties you want to include in the CSV
$selectedProperties = $jsonObjects | ForEach-Object {
    $_ | Select-Object id, jump_group_id, name, fqdn, operating_system, public_ip, private_ip, console_user, last_connect_timestamp
}

# Export the selected properties to a CSV file
$selectedProperties | Export-Csv -Path $csvFileName -NoTypeInformation

Write-Host "Output saved as $csvFileName"
