#!/bin/bash

exec 6>&-
exec 6<&-

while ! exec 6<>/dev/tcp/redis/6379; do
    echo "$(date) - still trying to connect to redis at redis:6379"
    sleep 1
done

exec 6>&-
exec 6<&-

until $(curl --output /dev/null --silent --fail "http://elasticsearch:9200/_cluster/health?wait_for_status=green&timeout=10s"); do
    sleep 1
done

exec 6>&-
exec 6<&-

cd /var/www/apisearch && \
    php bin/console apisearch-server:create-index 96a53eaf e7185a86 && \
    php bin/console apisearch-server:generate-basic-tokens 96a53eaf
