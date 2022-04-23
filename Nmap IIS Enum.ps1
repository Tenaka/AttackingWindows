#IIS Enum

nmap -sV --script http-enum 10.2.23.197 -p80

nmap -sV --script http-headers -p80 10.2.23.197

nmap --script http-methods --script-args http-methods.url-path='/webdav/' IP


nmap --script http-webdav-scan --script-args http-methods.url-path='/webdav/' IP
