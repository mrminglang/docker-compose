FROM centos:centos7 As First
MAINTAINER "ming <mrminglang@gmail.com>"

# 设置镜像源
RUN cd /etc/yum.repos.d/
# RUN mkdir repo_bak
# RUN mv *.repo repo_bak/
COPY *.repo /etc/yum.repos.d/

RUN yum clean all
RUN yum makecache
RUN yum list | grep epel-release

# tafcpp依赖
RUN yum install -y gcc gcc-c++ make libtool git wget initscripts openssh-server openssl openssl-devel sudo tcl cmake net-tools which netstat lsof vim htop

# 启动SSH服务
RUN systemctl enable sshd

# 设置root用户密码
RUN echo 'root:123456' | chpasswd

# 创建taf用户
RUN useradd taf -u 1000

RUN mkdir -p /usr/local/taf/
RUN mkdir -p /home/tafjce/
RUN mkdir -p /wp/

CMD ["/usr/sbin/init"]

#　第二阶段 压缩镜像
FROM scratch
COPY --from=First / /

WORKDIR /wp/

