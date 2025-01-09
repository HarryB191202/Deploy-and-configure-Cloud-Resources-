$rg = 'HB001153227'
New-AzResourceGroup -Name $rg -Location australiaeast -Force
New-AzResourceGroupDeployment -ResourceGroupName 'HB001153227' -templateFile 'A2T4Q2-webapp.json' -templateParameterFile 'A2T4Q2-webappparam.json'