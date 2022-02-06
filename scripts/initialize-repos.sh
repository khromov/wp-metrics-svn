#!/bin/bash

# See this issue in case of revprop hook problem: https://stackoverflow.com/a/10268958
docker exec wp-metrics-svn-svn bash -c 'cd /home/svn && svnadmin create plugins'
docker exec wp-metrics-svn-svn bash -c 'echo "#!/bin/sh" > /home/svn/plugins/hooks/pre-revprop-change'
docker exec wp-metrics-svn-svn bash -c 'chmod 755 /home/svn/plugins/hooks/pre-revprop-change'
docker exec wp-metrics-svn-svn bash -c 'svnsync init file:///home/svn/plugins/ https://plugins.svn.wordpress.org/'

docker exec wp-metrics-svn-svn bash -c 'cd /home/svn && svnadmin create themes'
docker exec wp-metrics-svn-svn bash -c 'echo "#!/bin/sh" > /home/svn/themes/hooks/pre-revprop-change'
docker exec wp-metrics-svn-svn bash -c 'chmod 755 /home/svn/themes/hooks/pre-revprop-change'
docker exec wp-metrics-svn-svn bash -c 'svnsync init file:///home/svn/themes/ https://themes.svn.wordpress.org/'

docker exec wp-metrics-svn-svn bash -c 'chown -R www-data:www-data /home/svn/'