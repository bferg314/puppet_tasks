# Get all running Java processes
if (Get-Command Get-Process -ErrorAction SilentlyContinue) {
    $processes = Get-Process -Name java -ErrorAction SilentlyContinue
    if ($processes) {
        Write-Output $processes
    } else {
        Write-Output "No Java processes found."
    }
} else {
    Write-Error "Error: 'Get-Process' cmdlet not found."
    exit 1
}
