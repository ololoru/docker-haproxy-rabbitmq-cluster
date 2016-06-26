#!/bin/sh

RAM_ARGS=

if [ ! -z "$RAM_NODE" ]; then
	RAM_ARGS=--ram
fi

until /etc/init.d/rabbitmq-server status > /dev/null
do
	echo "RabbitMQ Server is not ready, sleeping 5 seconds";
	sleep 5
done


echo "RabbitMQ Server is ready"

if [ ! -z "$CLUSTER_WITH" ]; then
	rabbitmqctl stop_app
	rabbitmqctl join_cluster $RAM_ARGS rabbit@$CLUSTER_WITH
	rabbitmqctl cluster_status
	rabbitmqctl start_app
fi