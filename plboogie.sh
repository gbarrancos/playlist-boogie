#!/bin/sh

#script args: playlist_name, max_storage

echo "Building playlist 'xyz' with max storage of 16GB ...."
lib/all_tracks.applescript | sort -r -t '|' -k 2 | lib/playlist.rb $1  > /tmp/plboogie_out

#Creating 'xyz' playlist on iTunes ....


#Done!
