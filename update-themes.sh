#!/bin/bash
#https://unix.stackexchange.com/questions/146756/forward-sigterm-to-child-in-bash

#_term() {
#  echo "Caught SIGTERM signal!"
#  #kill -TERM "$child" 2>/dev/null
#  echo "CHILD: $child"
#  kill -2 "$child" > /home/svn/log.txt #svnsync needs SIGINT to terminate properly
#}

#trap _term SIGTERM

#echo "Starting update...";
exec svnsync --non-interactive --steal-lock sync file:///home/svn/themes #&

#child=$!
#wait "$child"

#while :
#    do
        # FIXME: Repo goes into broken state when you ctrl+c out of it.
        # https://stackoverflow.com/questions/41097652/how-to-fix-ctrlc-inside-a-docker-container
#       svnsync --non-interactive --steal-lock sync file:///home/svn/themes # --steal-lock
#	sleep 300
#done