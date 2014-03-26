playlist-boogie
===============

A straightforward command-line tool for automatically generating iTunes Playlists with a given storage limit. Useful when your Music Library is too big to fit in your iPod or when you want to quickly burn a DVD with an excerpt of your library without thinking too much.

System Requirements
-------------------

 * OS X 10.8 or higher
 * Python 2.6 or higher

Usage
-----

`plboogie [-h] [--priority {newest,most_listened,least_listened}]
               [--storage_size STORAGE_SIZE] [--name NAME]

Storage aware iTunes playlist generator

optional arguments:
  -h, --help            show this help message and exit
  --priority {newest,most_listened,least_listened}
                        Track priority criteria (default: newest)
  --storage_size STORAGE_SIZE
                        Maximum playlist size in GB (default: 8)
  --name NAME           iTunes Playlist Name (default: plboogie)
`


Future Features:
---------------

* Export playlists to Android devices