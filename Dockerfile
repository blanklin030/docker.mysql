FROM mysql:5.7


# 设置时区
ENV TZ=Asia/Shanghai

# 设置免密登录
# ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

# 设置账户的用户名和密码
ENV MYSQL_ROOT_PASSWORD: "123456"
ENV MYSQL_USER: "root"

# 将所需文件放到容器中
COPY ./script/setup.sh /mysql/setup.sh
RUN chmod +x /mysql/setup.sh
COPY ./sql/ /mysql/

EXPOSE 3306

# 设置容器启动时执行的命令
CMD ["sh", "/mysql/setup.sh"]
