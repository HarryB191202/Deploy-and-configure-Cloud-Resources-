$rg = 'HB001153227'
New-AzResourceGroup -Name $rg -Location australiaeast -Force

New-AzResourceGroupDeployment `
    -Name 'DBCosmoDeploy' `
    -ResourceGroupName $rg `
    -TemplateFile 'A2T4Q1-cosmodb.json'
