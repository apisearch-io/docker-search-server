#!/bin/sh

#
# Connecting to Redis
#
until nc -z apisearch.redis 6379;
do
  echo "Waiting REDIS. Slepping";
  sleep 1;
done;
echo "Connected to REDIS!";

#
# Connecting to AMQP / RabbitMQ
#
until nc -z apisearch.amqp 5672;
do
  echo "Waiting AMQP. Slepping";
  sleep 1;
done;
echo "Connected to AMQP!";

#
# Connecting to Postgres
#
until nc -z apisearch.mysql 3306;
do
  echo "Waiting MYSQL. Slepping";
  sleep 1;
done;
echo "Connected to MYSQL!";

#
# Connecting to Elasticsearch
#
until $(curl --output /dev/null --silent --fail "http://apisearch.elasticsearch:9200/_cluster/health?wait_for_status=yellow&timeout=10s"); do
  echo "Waiting Elasticsearch. Slepping";
  sleep 1;
done


sh ${*:0};
