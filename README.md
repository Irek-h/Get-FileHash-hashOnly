# Get-FileHash Hash sanitized
Get Hash as variable from PS Get-FileHash cmdlet
```
(Get-FileHash hash_test.txt | Format-List | Out-String).Trim().split([Environment]::NewLine)[2].split(':')[1].Trim()
```

Get-FileHash output looks like this
![obraz](https://user-images.githubusercontent.com/82705344/145817672-cea717ad-b2e4-40f0-82de-3abaedf15443.png)
 
 That is the output of the command
![obraz](https://user-images.githubusercontent.com/82705344/145818144-82cbac71-6eec-4197-9f37-93385cf80e9f.png)

Example use:
Those are hashes of VirtualBox files
```
a5ee3e693a0470a77735556a77a09aa83bfc48181998b9b21b1af82ef1d11c2a *Oracle_VM_VirtualBox_Extension_Pack-6.1.30-148432.vbox-extpack
```
Copy the value and filename -> compare it with sanitized Get-FileHash output [True, False]
```
"a5ee3e693a0470a77735556a77a09aa83bfc48181998b9b21b1af82ef1d11c2a" -eq `
(Get-FileHash Oracle_VM_VirtualBox_Extension_Pack-6.1.30-148432.vbox-extpack | Format-List | Out-String).Trim().split([Environment]::NewLine)[2].split(':')[1].Trim()
```

Add ps1 script

P.S. This is awful solution, but had to be done asap and couldn't find any Get-FileHash flag that would allow to get only hash as return value.
