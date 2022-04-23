#Domain Enumeration

#.net
$adClass= [System.DirectoryServices.ActiveDirectory.Domain]
$adClass::GetCurrentDomain()




#wmi




#native commands

net user

NETDOM QUERY FSMO 

#register scm
regsvr32 schmmgmt.dll


#PS Command
Get-ADDomainController
Get-ADDomainController -Server dc19-2

#Password Policy
Get-ADDefaultDomainPasswordPolicy

#Domain and Forest details
Get-ADDomain
Get-ADDomain -Server dc19-2

Get-ADDomain -Identity fqdn
Get-ADForest -Identity fqdn

#FSMO Roles
Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator
Get-ADForest | Select-Object DomainNamingMaster, SchemaMaster




