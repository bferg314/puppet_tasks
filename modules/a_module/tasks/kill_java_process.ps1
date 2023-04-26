# Kill the specified Java process
param(
    [parameter(mandatory= $true)]
    [string]$process_name
)

$process = Get-Process -Name $process_name -ErrorAction SilentlyContinue
if ($process) {
    Stop-Process -InputObject $process
    Write-Output "Process '$process_name' killed successfully."
    exit 0
}
else {
    Write-Error "Error: process '$process_name' not found."
    exit 1
}
