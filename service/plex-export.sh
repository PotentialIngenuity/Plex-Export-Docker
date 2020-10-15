#!/usr/bin/env bash
source /root/.bashrc

while true
do
    if [ -z $PLEX_TOKEN ]
    then    
        php /app/cli.php -plex-url=$PLEX_URL
    else
        php /app/cli.php -plex-url=$PLEX_URL -token=$PLEX_TOKEN
    fi
    sleep $REFRESH_RATE
done