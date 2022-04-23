#Enumerate OUs

Get-ADOrganizationalUnit -Filter 'name -like "*admin*"'






#Name OU and search for servers that respond to ping
$ous = (read-host "Enter  OU")
$ous2 = Get-ADOrganizationalUnit -filter 'Name -like $OUs'

Foreach ($ou in $ous2)
{
$oudnlist = $ou | select distinguishedname
$servernames = get-adcomputer -LDAPFilter "(name=*)" -searchbase $ou | Foreach-object {$_.Name} | Sort-object -Desc
Foreach ($servername in $servernames)
{
$servername | write-host
if ($servername -notlike $null)
{
if ((test-connection -cn $servename -count 1 -ErrorAction 0))
	{$isonline = $online}
	try {
		invoke-command -cn $servername -scriptblock {cmd /c echo n | gpupdate /force}
	}
	catch{
		$ou | select-object distinguishname | out-file D:\data\failed.txt
	}    }
}}