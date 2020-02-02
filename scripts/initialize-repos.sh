#!/bin/bash
docker exec wp-metrics-svn_svn_1 bash -c 'cd /home/svn && svnadmin create plugins'
docker exec wp-metrics-svn_svn_1 bash -c 'echo "#!/bin/sh" > /home/svn/plugins/hooks/pre-revprop-change'
docker exec wp-metrics-svn_svn_1 bash -c 'chmod 755 /home/svn/plugins/hooks/pre-revprop-change'
docker exec wp-metrics-svn_svn_1 bash -c 'svnsync init file:///home/svn/plugins/ https://plugins.svn.wordpress.org/'

docker exec wp-metrics-svn_svn_1 bash -c 'cd /home/svn && svnadmin create themes'
docker exec wp-metrics-svn_svn_1 bash -c 'echo "#!/bin/sh" > /home/svn/themes/hooks/pre-revprop-change'
docker exec wp-metrics-svn_svn_1 bash -c 'chmod 755 /home/svn/themes/hooks/pre-revprop-change'
docker exec wp-metrics-svn_svn_1 bash -c 'svnsync init file:///home/svn/themes/ https://themes.svn.wordpress.org/'

docker exec wp-metrics-svn_svn_1 bash -c 'chown -R www-data:www-data /home/svn/'