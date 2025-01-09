Stop-AzVM -Name $vm.WebDev001153227 -ResourceGroupName $vm.H_B001153227

Remove-AzVM -Name $vm.WebDev001153227 -ResourceGroupName $vm.H_B001153227

Get-AzResource -ResourceGroupName $vm.H_B001153227 | Format-Table

