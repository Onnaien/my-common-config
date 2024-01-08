# Avoiding drive letter to cope with using c on one computer and d on another:
$gitRepoPath = "/git/my-powershell-setup/"
$symlinkParams = @{
  Path = $PROFILE
  Value = "$gitRepoPath/PowerShell/Microsoft.PowerShell_profile.ps1"
  ItemType = 'SymbolicLink'
  Force = $true
}
New-Item @symlinkParams