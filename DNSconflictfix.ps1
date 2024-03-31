# Define remote computer name
$remoteComputer = "RemoteComputerName"

# Prompt user for the remote computer name
$remoteComputer = Read-Host "Please specify host"

# PowerShell script block containing the commands
$scriptBlock = {
  Set-NetAdapterAdvancedProperty -Name "Wi-Fi" -AllProperties -RegistryKeyword "SoftwareRadioOff" -RegistryValue "1"
  ipconfig /flushdns
  ipconfig /registerdns
}

# Invoke the script block on the remote computer
Invoke-Command -ComputerName $remoteComputer -ScriptBlock $scriptBlock
