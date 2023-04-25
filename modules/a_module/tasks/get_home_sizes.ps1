# Get the size of all user profiles
Get-ChildItem -Path C:\Users -Directory | ForEach-Object {
    $size = (Get-ChildItem $_.FullName -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
    $_.Name + ": " + ($size / 1MB).ToString("F2") + " MB"
}
