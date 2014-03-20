#!/bin/sh

#Usage ./plboogie.sh <playlist_name> <max_storage_size_in_gb>

PLAYLIST_NAME="${1:-plboogie}"
MAX_SIZE="${2:-8}"
TRACKLIST_FILE="/tmp/plboogie_out"

echo "Building playlist with max storage of ${MAX_SIZE} GB ...."
lib/all_tracks.applescript | sort -r -t '|' -k 2 | lib/playlist.rb $MAX_SIZE  > $TRACKLIST_FILE

echo "Creating '$PLAYLIST_NAME' playlist on iTunes ...."
lib/create_playlist.sh $PLAYLIST_NAME $TRACKLIST_FILE

rm $TRACKLIST_FILE
