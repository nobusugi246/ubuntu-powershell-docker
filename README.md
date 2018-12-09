 利用方法
 ====
 
 起動例
 ----
 
```
$ docker run -d -p 10022:22 powershell 
```
 
 PowerShellによるログイン
 ----
 
```
> Enter-PSSession -HostName xx.xx.xx.xx -UserName root -Port 10022
```
