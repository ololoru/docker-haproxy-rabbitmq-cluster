### Use most recent official stable rabbitmq version
FROM rabbitmq

MAINTAINER ololo-ru@yandex.ru

ENV RABBIT_COOKIE=cookie
ENV RABBITMQ_SERVER_START_ARGS="-setcookie $RABBIT_COOKIE"
ENV RABBITMQ_CTL_ERL_ARGS="-setcookie $RABBIT_COOKIE"

RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management rabbitmq_federation sockjs rabbitmq_mqtt rabbitmq_stomp rabbitmq_federation_management

COPY rabbitmq_conf.sh /opt/rabbitmq_conf.sh
RUN chmod +x /opt/rabbitmq_conf.sh


RUN apt-get update && apt-get install -yqq supervisor
COPY supervisord.conf /opt/supervisord.conf

COPY rabbitmq.config /etc/rabbitmq/rabbitmq.config

## 5672 is already exposed in base image
## Expose additional ports
EXPOSE 15672 25672

ENTRYPOINT supervisord -c /opt/supervisord.conf
