#SOURCE :https://stackoverflow.com/questions/39010405/powershell-how-to-delete-a-path-in-the-path-environment-variable
# Modify PATH variable
function changePath ($action, $addendum) {
    $regLocation = 
"Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment"
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

# Add an item to your path
changePath "add" "C:\Program Files\RAWcooked"

# Remove an item from your path
#changePath "remove" "C:\Program Files\RAWcooked"