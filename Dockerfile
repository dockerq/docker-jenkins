FROM jenkins:2.19.3-alpine
MAINTAINER adolphlwq kenan3015@gmail.com
USER root
RUN echo "http://dl-6.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk --update add docker=1.11.2-r1
USER ${user}
