$rg = 'HB001153227'
$pass = ConvertTo-SecureString "Azure1234567!" -AsPlainText -Force
New-AzResourceGroup -Name $rg -Location australiaeast -Force

New-AzResourceGroupDeployment `
	-ResourceGroupName $rg `
	-TemplateFile "A2T1Q6avmHB.json" `
	-TemplateParameterFile "A2T1Q6avmHBpar.json" `
	-adminPasswordOrKey $pass