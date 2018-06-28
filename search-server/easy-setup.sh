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
    appId=$(< /dev/urandom tr -dc a-z0-9 | head -c${1:-12}) && \
    indexId=$(< /dev/urandom tr -dc a-z0-9 | head -c${1:-12}) && \
    php bin/console apisearch-server:create-index $appId $indexId && \
    php bin/console apisearch-server:generate-basic-tokens $appId
