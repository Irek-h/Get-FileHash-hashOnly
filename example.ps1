$path = $env:USERPROFILE + "\Downloads"

$url = "https://download.virtualbox.org/virtualbox/6.1.30/VirtualBox-6.1.30-148432-Win.exe"
$hash = "1d085322564f039bf4f46fcb42735516b1a04629ec83da5b97f759e27fecbcdf"

Invoke-WebRequest $url -OutFile "$path\VirtualBox-6.1.30-148432-Win.exe"
Set-Location $path
$hash_compare = ($hash -eq (Get-FileHash -Algorithm SHA256 .\VirtualBox-6.1.30-148432-Win.exe | Format-List | Out-String).Trim().split([Environment]::NewLine)[2].split(':')[1].Trim().ToLower())
if($hash_compare){
    Write-Host "I Worekd!"
    # Install Software that was checked
}
else {
    Write-Host "HASH ERROR!"
}