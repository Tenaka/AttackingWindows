#referemce https://nmap.org/nsedoc/scripts/


nmap --script smb-security-mode -p445 IP
nmap --script smb-enum-users -p445 IP
nmap --script smb-enum-shares -p445 IP
nmap --script smb-enum-sessions --script-args smbusername=adminstrator,smbpassword=password IP


nmap --script smb-server-stats --script-args smbusername=adminstrator,smbpassword=password IP
nmap --script smb-enum-domains --script-args smbusername=adminstrator,smbpassword=password IP
nmap --script smb-enum-services --script-args smbusername=adminstrator,smbpassword=password IP

#list content
nmap --script smb-enum-shares,smb-ls --script-args smbusername=adminstrator,smbpassword=password IP