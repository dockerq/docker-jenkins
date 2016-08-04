FROM jenkins:2.7.1
USER root
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get --no-install-recommends -y --force-yes install mesos=0.28.1-2.0.20.ubuntu1404
RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ENV MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so
USER ${user}
