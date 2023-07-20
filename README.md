# docker-smartdns
#### **使用**

##### docker-compose.yaml文件参考

```yaml
version: '3'
services:
  app:
    image: 'saberfordocker/smartdns:latest'
    # restart: unless-stopped
    restart: always
    container_name: smartdns
    ports:
      - "7053:53/udp" #宿主机7053映射容器内部53
      - "7053:53/tcp"
    volumes:
      - ./smartdns.conf:/smartdns/smartdns.conf # docker-compose.yaml文件同目录下smartdns.conf文件映射到容器内部
```
##### 启动

```bash
docker compose up -d
```

#### **介绍**

项目仓库

本项目使用https://github.com/pymumu/smartdns 提供的程序制作.
本项目参考https://github.com/easy-docker/smartdns 并额外提供其他架构的docker镜像

>SmartDNS是一个运行在本地的DNS服务器，SmartDNS接受本地客户端的DNS查询请求，从多个上游DNS服务器获取DNS查询结果，并将访问速度最快的结果返回给客户端，避免DNS污染，提高网络访问速度。 同时支持指定特定域名IP地址，并高性匹配，达到过滤广告的效果。

>与dnsmasq的all-servers不同，smartdns返回的是访问速度最快的解析结果。
