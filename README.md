# docker-haproxy-rabbitmq-cluster
#### Dockerfile for a rabbitmq cluster balanced by HAProxy.

RabbitMQ cluster inspired by [docker-rabbitmq-cluster](https://github.com/bijukunjummen/docker-rabbitmq-cluster).

Dockerfile builds 3 node cluster that is balanced by HAProxy.
HAProxy is the only server exposing it's ports outside.



Base image rabbitmq-base is built on top of official RabbitMQ https://github.com/docker-library/rabbitmq

#### Structure:
* rabbitmq-base - base rabbitmq image
* haproxy - haproxy image
* cluster - docker-compose YAML file


####Usage:

1. `make` - build all required images

2. `docker-compose up` - start 3 node RMQ cluster + haproxy