
#首先，以下是常用命令：
③　initdb 初始化 数据库。

④　pg_ctl start 启动数据库

⑤　pg_ctl stop 停止数据库

⑥　post_svc -install 建立windows nt 服务（需要设置系统环境变量）

⑦　post_svc -remove 删除 windows nt 服务

⑧　使用"createdb 库名" 新建数据库

⑨　使用"createuser 用户名"创建数据库帐号

⑩　使用"psql -h localhost -d 库名- U 用户名"进入数据库

接着来讲解:

#一、下载postgresql for windows

http://www.enterprisedb.com/products/pgbindownload.do
免安装的，直接解压到硬盘的一个目录下。笔者在d:\pgsql

#二、设置环境变量，可以把以下内容写成一个BAT
set PGHOME=d:\pgsql

set PATH=%PGHOME%\bin;%path%

set PGHOST=localhost

set PGLIB=%PGHOME%\lib

set PGDATA=%PGHOME%\data

##笔者把它们写成了inst.bat
D:\pgsql>inst

D:\pgsql>set PGHOME=d:\pgsql

D:\pgsql>set PATH=d:\pgsql\bin;d:\pgsql\bin;d:\pgsql\bin;C:\Windows\system32;C:\
Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\
Program Files\Common Files\Thunder Network\KanKan\Codecs;C:\Program Files\Micros
oft SQL Server\90\Tools\binn\;d:\MATLAB7\bin\win32;

D:\pgsql>set PGHOST=localhost

D:\pgsql>set PGLIB=d:\pgsql\lib

D:\pgsql>set PGDATA=d:\pgsql\data

#三、初始化数据库
D:\pgsql>initdb --locale=C

The files belonging to this database system will be owned by user "Administrator
".
This user must also own the server process.
The database cluster will be initialized with locale C.
The default database encoding has accordingly been set to SQL_ASCII.
The default text search configuration will be set to "english".
fixing permissions on existing directory d:/pgsql/data ... ok
creating subdirectories ... ok
selecting default max_connections ... 100
selecting default shared_buffers ... 32MB
creating configuration files ... ok
creating template1 database in d:/pgsql/data/base/1 ... ok
initializing pg_authid ... ok
initializing dependencies ... ok
creating system views ... ok
loading system objects' descriptions ... ok
creating conversions ... ok
creating dictionaries ... ok
setting privileges on built-in objects ... ok
creating information schema ... ok
vacuuming database template1 ... ok
copying template1 to template0 ... ok
copying template1 to postgres ... ok
WARNING: enabling "trust" authentication for local connections
You can change this by editing pg_hba.conf or using the -A option the
next time you run initdb.
Success. You can now start the database server using:
    "postgres" -D "d:/pgsql/data"
or
    "pg_ctl" -D "d:/pgsql/data" -l logfile start

#四、启动
D:\pgsql>pg_ctl start

#五、重新开一个MSDOS窗口
##创建数据库,以mydb为例
D:\pgsql>createdb -h 127.0.0.1 mydb

##创建用户
D:\pgsql>createuser -h 127.0.0.1 deepfuture

Shall the new role be a superuser? (y/n) y
D:\pgsql>

D:\pgsql>

#六、启动图形界面开始管理
启动pgAdmin3.exe程序进行配置（在BIN目录下）
![1](https://raw.github.com/luowei/demo-repo/master/doc/img/db/postgresql_admin_1.jpg)

![2](https://raw.github.com/luowei/demo-repo/master/doc/img/db/postgresql_admin_2.jpg)
