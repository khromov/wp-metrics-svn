#!/bin/bash
while :
    do
        # FIXME: Repo goes into broken state when you ctrl+c out of it.
        # https://stackoverflow.com/questions/41097652/how-to-fix-ctrlc-inside-a-docker-container
       svnsync --non-interactive --steal-lock sync file:///home/svn/themes # --steal-lock
	sleep 300
done