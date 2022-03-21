FROM sreworks-registry.cn-beijing.cr.aliyuncs.com/mirror/python:3.9.7-alpine3.13
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
COPY . /app
WORKDIR /app
RUN apk add zip curl
RUN wget https://sreworks.oss-cn-beijing.aliyuncs.com/bin/mc-linux-amd64 -O /app/mc && chmod +x /app/mc
RUN chmod +x /app/resource.sh
ENTRYPOINT ["/bin/sh", "/app/resource.sh"]
