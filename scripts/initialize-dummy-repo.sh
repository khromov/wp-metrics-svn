#!/bin/bash
docker exec wp-metrics-svn_update-plugins_1 bash -c 'cd /home/svn && svnadmin create dummy'
docker exec wp-metrics-svn_update-plugins_1 bash -c 'chown -R www-data:www-data /home/svn/'