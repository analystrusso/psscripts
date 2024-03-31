Search-ADAccount -passwordexpired | Select-Object Name, SamAccountName

$samAccountName = Read-Host -Prompt "Enter the username of the password you wish to reset."

if($samAccountName) {
  Set-ADAccountPassword -Identity $samAccountName -NewPassword (ConvertTo-SecureString -AsPlainText "newpassword123!" -Force)
  Set-ADUser -Identity $samAccountName -ChangePasswordAtLogon $false
  }
