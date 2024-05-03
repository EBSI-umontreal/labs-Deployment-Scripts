#SOURCE :https://stackoverflow.com/questions/39010405/powershell-how-to-delete-a-path-in-the-path-environment-variable
#& modifications avec ChatGPT
# Modify PATH variable
function changePath ($action, $addendum) {
    $regLocation = "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment"
    $path = (Get-ItemProperty -Path $regLocation -Name PATH).path

    # Add an item to PATH
    if ($action -eq "add") {
        $path = "$path;$addendum"
        Set-ItemProperty -Path $regLocation -Name PATH -Value $path
    }

    # Remove an item from PATH
    if ($action -eq "remove") {
        $path = ($path.Split(';') | Where-Object { $_ -ne "$addendum" }) -join ';'
        Set-ItemProperty -Path $regLocation -Name PATH -Value $path
    }
}

# Check if there are enough arguments
if ($args.Count -lt 2) {
    Write-Host "Usage: PowerShell.exe -ExecutionPolicy Bypass -NoLogo -File ""%~dp0PATH-variable-add.ps1"" <add/remove> <path>"
    Exit
}

# Get action and addendum from arguments
$action = $args[0]
$addendum = $args[1]

# Add or remove an item from PATH based on arguments
changePath $action $addendum

#exemples
#powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp0PATH-variable-add.ps1" add "C:\Program Files\FFmpeg\bin"
#powershell.exe -ExecutionPolicy Bypass -NoLogo -File "%~dp0PATH-variable-add.ps1" remove "C:\Program Files\FFmpeg\bin"
