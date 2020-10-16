#!/usr/bin/env bash
source /root/.bashrc

while true
do
    
    php /app/cli.php -plex-url=$PLEX_URL -token=$PLEX_TOKEN -sections="$PLEX_SECTIONS" -sort-skip-words="$PLEX_SORT_SKIP_WORDS"
    
    sleep $REFRESH_RATE
done