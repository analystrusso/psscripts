# Search for locked users in Active Directory
$lockedusers = Search-ADAccount -lockedout | Select-Object Name, SamAccountName

# Prompt user for desired username to unlock
$samAccountName = Read-Host -Prompt "Enter the username of the account you wish to unlock."

#If the given username is locked, unlock it. Else report that it isn't locked to begin with.
If ($lockedusers.SamAccountName -contains $samAccountName) {
Unlock-ADAccount -Identity $samAccountName
} 
ELSE {
Write-Host $samAccountName "Not locked."
