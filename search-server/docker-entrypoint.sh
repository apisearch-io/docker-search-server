#!/bin/bash

cp /var/www/apisearch/docker/search-server/app_deploy.yml /var/www/apisearch/
exec /usr/bin/supervisord --nodaemon