Get-SmbShare 

Invoke-Command -ComputerName toyodc19-1 {Get-SmbShare}

Get-SmbConnection -ServerName toyodc19-1

Get-SmbGlobalMapping -Rem

Get-GPO

Get-GPO -All

Get-GPOReport -Guid 7ef02172-7c5d-473c-af82-117d44995b68 -ReportType xml | select-string "password"

Get-GPOReport

Get-Acl -