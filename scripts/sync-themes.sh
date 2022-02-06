#!/bin/bash
docker exec -it wp-metrics-svn-svn bash -c 'svnsync --non-interactive sync file:///home/svn/themes'