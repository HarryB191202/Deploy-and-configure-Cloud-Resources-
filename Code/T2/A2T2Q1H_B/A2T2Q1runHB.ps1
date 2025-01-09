$rg = 'HB001153227'
$pass = ConvertTo-SecureString "Azure69420?" -AsPlainText -Force
New-AzResourceGroup -Name $rg -Location australiaeast -Force

New-AzResourceGroupDeployment `
	-ResourceGroupName $rg `
	-TemplateFile "A2T2Q1vmHB.json" `
	-TemplateParameterFile "A2T2Q1vmHBpar.json" `
	-adminPasswordOrKey $pass
