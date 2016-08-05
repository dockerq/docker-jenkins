FROM jenkins:2.7.1
USER root
#install mesos
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get --no-install-recommends -y --force-yes install mesos=0.28.1-2.0.20.ubuntu1404
RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ENV MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so
# install docker
RUN echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list.d/backports.list && \
    apt-get update && \
    apt-get install -y apt-get install apt-transport-https ca-certificates && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-engine=1.11.2-0~jessie && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER ${user}
