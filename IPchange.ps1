$Adapters = Get-NetAdapter | Select-Object -Property Name, InterfaceIndex
Write-Host "Available adapters:"
for ($i = 0; $i -lt $Adapters.Count; $i++) {
    Write-Host "$i: $($Adapters[$i].Name)"
}
$SelectedAdapterIndex = Read-Host "Enter the index of the adapter you want to change"
$SelectedAdapter = $Adapters[$SelectedAdapterIndex]

$IPAddress = Read-Host "Enter the IP address you would like to set for the $($SelectedAdapter.Name) adapter"
$SubnetMask = Read-Host "Enter the subnet mask you would like to set for the $($SelectedAdapter.Name) adapter"
$DefaultGateway = Read-Host "Enter the default gateway you would like to set for the $($SelectedAdapter.Name) adapter"

New-NetIPAddress -IPAddress $IPAddress -PrefixLength $SubnetMask -InterfaceIndex $SelectedAdapter.InterfaceIndex | Out-Null
Set-NetIPInterface -InterfaceIndex $SelectedAdapter.InterfaceIndex -DefaultGateway $DefaultGateway | Out-Null
