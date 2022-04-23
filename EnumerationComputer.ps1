#Computer Enumeration

Get-ADComputer -Filter * -Properties * | where {$_.operatingsystem -like "*2012*"}
Get-ADComputer -Filter 'operatingsystem -like "*2012*"'

Get-ADComputer -Filter * -Properties DNSHostName | foreach {Test-Connection -count 1 -ComputerName $_.dnshostname} 
$listResponces = Get-ADComputer -Filter * -Properties DNSHostName | foreach {Test-Connection -count 1 -ComputerName $_.dnshostname}

#test ldaps
$netcon135 = Get-ADComputer -Filter * -Properties DNSHostName | foreach {Test-NetConnection -ComputerName $_.dnshostname -port 135} | where{$_.PingSucceeded  -eq "true"}

