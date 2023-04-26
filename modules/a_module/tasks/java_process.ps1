if ([string]::IsNullOrWhiteSpace($env:PT_action)) {
    Write-Error "Error: action parameter not provided."
    exit 1
}
  
if ($env:PT_action -eq "get") {
    # Get all running Java processes
    if (Get-Command Get-Process -ErrorAction SilentlyContinue) {
        $processes = Get-Process -Name java -ErrorAction SilentlyContinue
        if ($processes) {
            Write-Output $processes
        }
        else {
            Write-Output "No Java processes found."
        }
    }
    else {
        Write-Error "Error: 'Get-Process' cmdlet not found."
        exit 1
    }
}
elseif ($env:PT_action -eq "kill") {
    if ([string]::IsNullOrWhiteSpace($env:PT_process_name)) {
        Write-Error "Error: process_name parameter not provided."
        exit 1
    }
  
    $process = Get-Process -Name $env
    if (!$process) {
        Write-Error "Error: process '$env:PT_process_name' not found."
        exit 1
    }
    
    $process | ForEach-Object {
        try {
            Stop-Process -InputObject $_ -ErrorAction Stop
            Write-Output "Process '$env:PT_process_name' killed successfully."
        }
        catch {
            Write-Error "Error: failed to kill process '$env:PT_process_name'."
            exit 1
        }
    }
}
else {
    Write-Error "Error: invalid action parameter '$env:PT_action'. Must be 'get' or 'kill'."
    exit 1
}
    
  