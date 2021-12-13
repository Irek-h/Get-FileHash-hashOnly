# Get-FileHash Hash sanitized
Make variable out of hash from "Get-FileHash" function
![obraz](https://user-images.githubusercontent.com/82705344/145817672-cea717ad-b2e4-40f0-82de-3abaedf15443.png)
 We want only this, stored as variable
![obraz](https://user-images.githubusercontent.com/82705344/145818144-82cbac71-6eec-4197-9f37-93385cf80e9f.png)

#### And this is the command for it:
```
(Get-FileHash hash_test.txt | Format-List | Out-String).Trim().split([Environment]::NewLine)[2].split(':')[1].Trim()
```

P.S. This is awful solution, but had to be done asap and couldn't find any Get-FileHash flag that would allow to get only hash as return value.
