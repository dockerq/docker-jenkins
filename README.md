# Jenkins on container
[![Docker Pulls](https://img.shields.io/docker/pulls/adolphlwq/docker-jenkins.svg?maxAge=2592000)]()

A simple Jenkins docker image. The master Dockerfile uses jenkins:2.19.3-alpine as base image.

## Usage
- quick start
```
docker pull adolphlwq/docker-jenkins:dind
docker run -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock adolphlwq/docker-jenkins:dind
```
then browser ip:8080 to see Jenkins UI
- on Mesos Cluster or DCOS,The Json for marathon:
```Json
{
  "id": "/cicd/jenkins",
  "cmd": null,
  "cpus": 0.5,
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
      },
      {
        "containerPath": "/var/run/docker.sock",
        "hostPath": "/var/run/docker.sock",
        "mode": ""
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
