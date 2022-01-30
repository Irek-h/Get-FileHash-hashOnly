$path = $env:USERPROFILE + "\Downloads"
#$path = "C:\Temp"

$url = "https://download.virtualbox.org/virtualbox/6.1.30/VirtualBox-6.1.30-148432-Win.exe"

Invoke-WebRequest $url -OutFile "$path\VirtualBox-6.1.30-148432-Win.exe"

$hash = "1d085322564f039bf4f46fcb42735516b1a04629ec83da5b97f759e27fecbcdf" # Hash provided by producer
$calculated_hash = (Get-FileHash -Algorithm SHA512 $path\VirtualBox-6.1.30-148432-Win.exe).Hash.ToLower()

if($hash -eq $calculated_hash){
    # Install Software
    Exit 0
}
else {
    Write-Error "Hash error"
    Exit 1
}
