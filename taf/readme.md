taf开发镜像以及命令

## 1.在docker环境中安装centos7环境
```shell
# 使用Dockerfile文件制作镜像
./build.sh
# 启动tafdev环境容器，依赖镜像tafdev:0.0.1 
# docker命令参数：--privileged=true 用于在运行容器时给予容器特殊访问主机系统的权限
# 在docker容器中，将CMD或entrypoint设置为/usr/sbin/init 可以启动systemd进程，实现在容器内容启动包括D-Bus在内的系统服务
docker run -itd -p 1022:22 --name tafdev --privileged=true tafdev:0.0.1 /usr/sbin/init

# 进入tafdev环境容器
docker exec -it tafdev /bin/bash
# 设置容器中root密码
echo 123456 | passwd --stdin root

```



