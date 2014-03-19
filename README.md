playlist-boogie
===============

A straightforward command-line tool for automatically generating iTunes Playlists with a given storage limit. Useful when your Music Library is too big to fit in your iPod or when you want to quickly burn a DVD with an excerpt of your library without thinking too much.

System Requirements
-------------------

 * OS X 10.8 or higher
 * Ruby 1.9 or higher

Usage
-----
`
./plboogie.sh <playlist_name> <max_storage_size_in_gb>

`

* Defaults: playlist_name => 'plboogie' , max_storage_size_in_gb => 8GB

Future Features:
---------------

* Customize track priority criteria  (date added to library, number of times played etc)
* Enforce presence of entire albums on the playlist
* Export playlists to Android devices