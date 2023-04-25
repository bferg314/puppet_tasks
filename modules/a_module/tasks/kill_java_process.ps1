# Kill the specified Java process
if ([string]::IsNullOrWhiteSpace($env:PT_process_name)) {
    Write-Error "Error: process_name parameter not provided."
    exit 1
}

$process = Get-Process -Name $env:PT_process_name -ErrorAction SilentlyContinue
if ($process) {
    Stop-Process -InputObject $process
    Write-Output "Process '$env:PT_process_name' killed successfully."
    exit 0
}
else {
    Write-Error "Error: process '$env:PT_process_name' not found."
    exit 1
}
