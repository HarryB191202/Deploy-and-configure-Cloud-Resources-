$rg = 'HB001153227'
New-AzResourceGroup -Name $rg -Location australiaeast -Force

New-AzResourceGroupDeployment `
    -Name 'HB001153227-Storage' `
    -ResourceGroupName $rg `
    -TemplateFile 'A2T1Q7-storageHB.json' `
    -storageName 'cld5c2azaa2stor001153227' `
    -storageSKU "Standard_GRS"

