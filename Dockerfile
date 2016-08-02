FROM jenkins:2.7.1
USER root
#install mesos
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get --no-install-recommends -y --force-yes install mesos=0.28.1-2.0.20.ubuntu1404
ENV MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so
USER ${user}
