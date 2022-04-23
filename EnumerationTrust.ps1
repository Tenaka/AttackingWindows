

Get-ADTrust -Filter 

Get-ADForest -Identity toyo.loc

Get-ADForest | select -ExpandProperty globalcatalogs

Get-ADTrust -Filter 'msds-trustForestRrustInfo -ne "$null"'