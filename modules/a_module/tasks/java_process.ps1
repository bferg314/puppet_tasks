param(
    [parameter(mandatory = $true)]
    [ValidateSet("get", "kill")]
    [string]$action,
    [string]$process_name
)

if ($action -eq "get") {
    # Get all running Java processes
    if (Get-Command Get-Process -ErrorAction SilentlyContinue) {
        $processes = Get-Process -Name java -ErrorAction SilentlyContinue | Select-Object Id, ProcessName, CPU, Handles, WS, VM, PM, NPM, Path
        if ($processes) {
            Write-Output $processes | Format-Table
        }
        else {
            Write-Output "No Java processes found."
        }
    }
    else {
        Write-Error "Error: 'Get-Process' command not found."
        exit 1
    }
}
elseif ($action -eq "kill") {
    if ([string]::IsNullOrWhiteSpace($process_name)) {
        Write-Error "Error: process_name parameter not provided."
        exit 1
    }
  
    if (!(Get-Process -ProcessName $process_name -ErrorAction SilentlyContinue)) {
        Write-Error "Error: process '$process_name' not found."
        exit 1
    }
  
    try {
        Stop-Process -ProcessName $process_name -Force -ErrorAction Stop
        Write-Output "Process '$process_name' killed successfully."
    }
    catch {
        Write-Error "Error: failed to kill process '$process_name'."
        exit 1
    }
}
else {
    Write-Error "Error: invalid action parameter '$action'. Must be 'get' or 'kill'."
    exit 1
}
