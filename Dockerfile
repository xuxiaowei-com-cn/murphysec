# 第一阶段：编译 git 源码

# 选择运行时基础镜像
FROM maven:3.6.3-jdk-8

# 维护人员
MAINTAINER 徐晓伟 xuxiaowei@xuxiaowei.com.cn

# 工作空间
WORKDIR /usr/local/murphysec/bin

# 查看文件
RUN ls

# 添加 murphysec
ADD murphysec-linux-amd64 .
# 重命名
RUN mv murphysec-linux-amd64 murphysec

# 授权
RUN chmod +x murphysec

# 查看文件
RUN ls

WORKDIR /home

ENV PATH=/usr/local/murphysec/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# sleep infinity：常驻内存
CMD sleep infinity
