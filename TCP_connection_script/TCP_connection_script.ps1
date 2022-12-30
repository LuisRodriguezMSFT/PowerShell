Do {
Test-NetConnection -Port 443 www.google.com | select @{n='TimeStamp';e={Get-Date}}, ComputerName, RemoteAddress, RemotePort, InterfaceAlias, SourceAddress, TcpTestSucceeded | out-file C:\output.txt -append
sleep 5
} while ($true)
