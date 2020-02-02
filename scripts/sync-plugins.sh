#!/bin/bash
docker exec -it wp-metrics-svn_svn_1 bash -c 'svnsync --non-interactive sync file:///home/svn/plugins'