
**Docker搭建环境**
===========

[![](https://img.shields.io/badge/powered-Docker-2496ed?logo=docker)](https://docker.com)
[![](https://img.shields.io/badge/powered-Docker_compose-2496ed?logo=docker)](https://docker.com)


## 步骤

1. 安装 `docker` ; 过程略

2. 安装 `docker-compose` ; 过程略

3. (准备导入的sql文件)
    > 默认使用 `tp.sql` ,但这数据只有表的结构,没有数据,所以最好替换成有完整库


4. 配置权限
    ```shell
    # php容器的默认运行用户的uid为33
    setfacl -R -m u:33:rwx ../../*
    ```

5. 配置mysql
    - 数据库连接地址: `mysql_container_name`
        > 修改配置 `configs/config_db.php` 下的 `host` 为 `mysql_container_name` ,(这名称在 `docker-compose.yml` 定义,也可改成文件内定义的 `ipv4_address` 地址)
    - 数据库名: `tp`
    - 用户:`tp` 密码:`tp`
    - 用户:`root` 密码:`tp`

6. 当前目录执行
    ```shell
    # 默认配置文件docker-compose.yml
    docker-compose up
    ```

## 注意

1. 注意宿主机80端口冲突,可修改 `docker-compose.yml` 文件改变端口

2. 默认 `http://tp.top` 访问站点域名

3. 如果要升级Php或Phalcon,修改文件 `dockerfile_phalcon_php`
