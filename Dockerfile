# 第一阶段：编译 git 源码

# 选择运行时基础镜像
FROM maven:3.6.3-jdk-8

# 维护人员
MAINTAINER 徐晓伟 xuxiaowei@xuxiaowei.com.cn

# 查看原始 Maven settings.xml
RUN cat /usr/share/maven/conf/settings.xml

# 修改 Maven settings.xml
RUN sed -i '/<\/servers>/i \
\    <server>\n\
      <id>${env.RELEASE_ID}</id>\n \
      <username>${env.RELEASE_USERNAME}</username>\n \
      <password>${env.RELEASE_PASSWORD}</password>\n \
    </server>\n \
    <server>\n \
      <id>${env.SNAPSHOT_ID}</id>\n \
      <username>${env.SNAPSHOT_USERNAME}</username>\n \
      <password>${env.SNAPSHOT_PASSWORD}</password>\n \
    </server>' /usr/share/maven/conf/settings.xml

# 查看修改后的 Maven settings.xml
RUN cat /usr/share/maven/conf/settings.xml

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
