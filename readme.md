如果你需要修改内置数据，请查看 [master 分支](https://github.com/bangumi/dev-env/tree/master)

Pull Request 也请向 master 分支提交。

## QuickStart

```bash
git clone https://github.com/bangumi/dev-env.git bangumi-dev-env --depth=1

cd bangumi-dev-env

docker-compose up --build -d
```

如果要使用 mysql binlog watcher，需要执行：

```bash
# start mysql binlog message watcher, optional
cd mq
docker-compose up -d
```

导入数据表：

```bash
# dist.sql 会 drop 旧数据表并且插入数据，可以多次运行。
mysql -h127.0.0.1 -uuser -ppassword bangumi < dist.sql
```

请确保安装了 mysql-client，如果没有，可以使用 `brew` 或者 `apt` 来安装。

## 使用说明

- 如果你不使用 docker 或者 docker-compose，也可以下载并导入 <https://bangumi.github.io/dev-env/dist.sql> 文件，此文件包含了本仓库的所有 sql 文件。

- 墙内可以访问 jsdelivr 镜像网址 https://cdn.jsdelivr.net/gh/bangumi/dev-env@gh-pages/dist.sql

- `./mq/` 文件夹包含 kafka 和 debezium 等组件的配置文件，用于解析 mysql 的 binlog， 基础的 http server 不需要这些服务，可以不启动。

- 如果你不在运行 docker-compose 的机器上进行开发（也就是说不使用`localhost`或者`127.0.0.1`来链接到数据库），
设置 `CHII_HOST` 环境变量来解决 kafka 的 `KAFKA_ADVERTISED_LISTENERS` 问题。

## 更新环境

```shell
git pull
bash scripts/reload.sh
```

## 可用账号

https://github.com/bangumi/dev-docs#api
