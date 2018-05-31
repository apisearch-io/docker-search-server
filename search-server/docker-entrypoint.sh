#!/bin/bash

cp /var/www/apisearch/docker/search-server/app_deploy.yml /var/www/apisearch/
php /var/www/apisearch/bin/console cache:warmup --env=prod
exec /usr/bin/supervisord --nodaemon