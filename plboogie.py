#!/usr/bin/env python

import argparse
import subprocess
import string
import os

def parse_args():
    argp = argparse.ArgumentParser(description='Storage aware iTunes playlist generator')
    
    argp.add_argument('--priority', choices=['newest', 'most_listened', 'least_listened'],
                      default='newest', 
                      help='Track priority criteria (default: %(default)s)')
    argp.add_argument('--storage_size', default=8, type=int,
                      help='Maximum playlist size in GB (default: %(default)s)')
    argp.add_argument('--name', default='plboogie',
                      help='iTunes Playlist Name (default: %(default)s)')

    return argp.parse_args()    


TRACKLIST_OUT_FILE = '/tmp/plboogie_out'


pars = parse_args()

priority_sort_params_map = {'newest': '-k 2 -r', 'most_listened': '-k 3 -r -n',
                            'least_listened': '-k 3 -n'}

print 'Building tracklist with maximum storage of ' + str(pars.storage_size) + 'GB (priority: ' + pars.priority + ') ...'

all_tracks_template = string.Template("lib/all_tracks.applescript | sort -t '|' $sort_params | lib/tracklist.py $storage_size > $tracklist_file")

tracks_command = all_tracks_template.substitute(sort_params=priority_sort_params_map[pars.priority],
                                                storage_size=pars.storage_size,
                                                tracklist_file=TRACKLIST_OUT_FILE)
subprocess.call(tracks_command, shell=True)

print 'Creating \'' + pars.name + '\' playlist on iTunes ...'

playlist_template = string.Template('lib/create_playlist.sh $name $tracklist_file')
playlist_command = playlist_template.substitute(name=pars.name, tracklist_file=TRACKLIST_OUT_FILE)

subprocess.call(playlist_command, shell=True)






