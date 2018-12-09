利用例
====

ビルド
----

```
$ docker build -t powershell .
```

起動
----

```
$ docker run -d -p 10022:22 powershell 
```

PowerShellによるログイン
----
 
```
> Enter-PSSession -HostName xx.xx.xx.xx -UserName root -Port 10022
```

参考URL
----

参考にさせて頂きました。

https://docs.docker.com/engine/examples/running_ssh_service/
