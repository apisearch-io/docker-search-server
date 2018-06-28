#!/bin/bash

php /var/www/apisearch/bin/console cache:warmup --env=prod
exec /usr/bin/supervisord --nodaemon