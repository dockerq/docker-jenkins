FROM jenkins:2.7.1
RUN apt-get update && \
    apt-get install openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
