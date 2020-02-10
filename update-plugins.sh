#!/bin/bash
while :
    do
       svnsync --non-interactive --steal-lock sync file:///home/svn/plugins # --steal-lock
	sleep 300
done