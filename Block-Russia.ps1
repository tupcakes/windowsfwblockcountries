$name = "BlockRussia"

$url = "https://www.ipdeny.com/ipblocks/data/countries/ru.zone"
$file = "c:\temp\ru.zone"
New-Item -Path c:\temp -ItemType Directory
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $url -OutFile $file



$russianIPs = Get-Content $file

$numrules = [math]::ceiling($russianIPs.count / 1000)


for ($i = 0; $i -lt $numrules; $i++) {
    $rulename = $name + "-" + $i
    New-NetFirewallRule -DisplayName $rulename -Direction Outbound
    
    Get-NetFirewallRule -DisplayName $rulename | 
        Get-NetFirewallAddressFilter | 
            Set-NetFirewallAddressFilter -RemoteAddress $russianIPs[($i * 1000)..(($i * 1000) + 1000)]
}
