FROM ubuntu:trusty

MAINTAINER guolin <guo.lin@outlook.com>

RUN apt-get update && \
    apt-get install -y --force-yes -m python-pip python-m2crypto &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install shadowsocks

ENV SS_SERVER_ADDR kevinljh3-ss.daoapp.io
ENV SS_SERVER_PORT 443
ENV SS_PASSWORD Ss123456
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE $SS_SERVER_PORT

CMD ["sh", "-c", "/start.sh"]
