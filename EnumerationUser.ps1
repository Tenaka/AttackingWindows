#User Enumeration

#native tools
whoami /priv

Net group “Domain Admins” /domain

Dsquery group -name “Domain Admins” | dsget group -members



#PowerShell
Get-ADUser -Filter *
Get-ADUser -Filter * | where {$_.givenname -eq "testadmin"}
get-aduser -filter 'samaccountname -like "*testadmin*"'

#List all attributes
Get-ADUser -Filter * -Properties * |select -First 1 |  Get-Member -MemberType *property | select name


Get-ADUser -Filter * -Properties * | where {$_.givenname -eq "testadmin"} | select sid, PasswordLastSet,PasswordExpired 
Get-ADUser -Filter * -Properties * | where {$_.givenname -eq "testadmin"} | select sid, PasswordLastSet,PasswordExpired, @{expression={[datetime]::FromFileTime($_.pwdlastset)}}

#get users details swap out -properties for * 
Get-ADUser -Filter * -Properties PasswordLastSet,logoncount,description |Select-Object name,passwordlastset,logoncount, description
Get-ADUser -filter 'Description -like "*built*"' -Properties description

#Get Admin Count
Get-ADUser -filter 'samaccountname -like "*"' -prop samaccountname, admincount | where {$_.admincount -eq "1"}

#get access list
(get-acl 'AD:\CN=testadmin,OU=TESTOrg,DC=TOYO,DC=LOC').access




#ADSI
$DomainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$Domain = [ADSI]”LDAP://$DomainObj”
$DN = $Domain.distinguishedName
$DomainAdmins = [ADSI]”LDAP://cn=Domain Admins,cn=Users,$DN”
“Group name “ + $DomainAdmins.sAMAccountName
ForEach ($MemberDN In $DomainAdmins.Member)
{
$Member = [ADSI]”LDAP://$MemberDN”
“ “ + $Member.cn
}

