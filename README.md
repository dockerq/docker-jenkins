#Jenkins Slave
[![Docker Pulls](https://img.shields.io/docker/pulls/adolphlwq/docker-jenkins.svg?maxAge=2592000)]()

A simple Jenkins docker image. The master Dockerfile uses Jenkins:2.7.1 as base image.

## Usage
1. launch a Jenkins docker image in Mesos Cluster, The Json file is:
```Json
{
  "id": "/cicd/jenkins-master",
  "cmd": null,
  "cpus": 1,
  "mem": 2048,
  "disk": 0,
  "instances": 1,
  "constraints": [
    [
      "hostname",
      "LIKE",
      "10.140.0.17"
    ]
  ],
  "container": {
    "type": "DOCKER",
    "volumes": [
      {
        "containerPath": "/var/jenkins_home",
        "hostPath": "/tmp/jenkins-master",
        "mode": "RW"
      }
    ],
    "docker": {
      "image": "jenkins:2.7.1",
      "network": "HOST",
      "privileged": true,
      "parameters": [],
      "forcePullImage": false
    }
  },
  "portDefinitions": [
    {
      "port": 10003,
      "protocol": "tcp",
      "labels": {}
    }
  ]
}
```
2. 注意主机文件的读写权限
