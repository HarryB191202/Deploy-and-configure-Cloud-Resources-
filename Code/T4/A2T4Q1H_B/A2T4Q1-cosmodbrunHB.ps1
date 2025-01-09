$rg = 'HB001153227'
New-AzResourceGroup -Name $rg -Location australiaeast  -Force

New-AzResourceGroupDeployment -ResourceGroupName 'HB001153227' -TemplateFile 'A2T4Q1-cosmodbHB.json'
