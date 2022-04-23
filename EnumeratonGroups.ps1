#Enumeration Groups

get-adgroup -Filter *

#get members of a group
Get-ADGroupMember -Identity "domain admins" -Recursive

#get group and the member of the group
$gg = get-adgroup -Filter 'name -like "*sccm*"' -Properties *| Select-Object SamAccountName
foreach ($g in $gg)
{
Write-Host $g -ForegroundColor Green
Get-ADGroupMember -Identity $g.SamAccountName | Select-Object samaccountName
}



#get group membership of account
Get-ADPrincipalGroupMembership -Identity samaccountname

