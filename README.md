
jenkins 本地环境代码 自动部署到 测试环境,线上环境 
===
-  可以填写一个相应版本号，更新到相应版本，默认是git最新版本（Console Output 输出最新5个版本,复制下版本号即可）
-  可以回滚一个版本
-  可以配置deny_file,可忽略文件列表，自动部署用过滤这些文件

### 1.所有环境安装好zip,git,并且配置好git 免密码模式。请参照 [https://blog.csdn.net/song3304/article/details/102754832](https://blog.csdn.net/song3304/article/details/102754832)

### 2.先安装好jenkis，配置好 测试服务器node,线上服务器node 请参照[https://blog.csdn.net/song3304/article/details/102754940](https://blog.csdn.net/song3304/article/details/102754940)

### 3.目录结构 local:本地机器，也是jenkins主机
-  test:测试服务(实际代码目录:/home/ubuntu/energy)
-  online:线上主机(实际代码目录:/home/www/xiwanghulian)  
-  如果机器没有相关目录，请自行mkdir -p ...  

### 4.所有的sh文件，都必须chmod +x ..,如果执行shell出现 /r 问题,请 set ff=unix,去掉回车.

### 5.所有主机ssh免登录设置，请参照 [https://blog.csdn.net/song3304/article/details/102755182](https://blog.csdn.net/song3304/article/details/102755182)


### 6.四个pipeline script文件功能介绍:
- local2test.jenkins   	本地更新到测试环境
- testRollback.jenkins 	测试环境代码rollback一次(目前只支持一次)
- local2online.jenkins 	本地更新到线上环境
- onlineRollback.jenkins  线上环境可rollback一次(目前只支持一次)

### 7.其他保存配置文件
- deny_file:可忽略文件列表
- local_version:本地版本号
- test_version:测试服务器版本号
- online_version:线上服务器版本号
- old_version:备份版本号(回滚要用)
- old_back.zip：备份zip包(回滚要用)

### 8.move_online.sh,move_test.sh,rollback_online.sh,rollback.test.sh中onlineServer_ip，testServer_ip请用自己实际服务器ip代替

### 9.注意各主机文件权限，可能会导致任务失败，必要时，chown 一下。
