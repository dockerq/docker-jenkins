FROM jenkins:2.19.3
MAINTAINER adolphlwq kenan3015@gmail.com

RUN echo "http://dl-6.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk --update add docker=docker-1.11.2-r1
