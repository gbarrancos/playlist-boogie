#!/usr/bin/env python

import sys

class TrackList(object):
    def __init__(self, max_size_in_gb):
        if int(max_size_in_gb) <= 0:
            raise ValueError("max_size_in_gb must be an integer > 0")

        self.max_storage_size = max_size_in_gb * 1024 * 1048576
        self.tracks = []
        self.current_size = 0

    def add_song(self, file_size, location):
        if self.current_size + file_size > self.max_storage_size:
            return False
        
        self.tracks.append(location)
        self.current_size += file_size
        return True

    def __str__(self):
        return '\n'.join(self.tracks)

max_storage_in_gb = int(sys.argv[1])
tracklist = TrackList(max_storage_in_gb)

#album|date_added_to_library|played_count|size_in_bytes|location
for track in sys.stdin.readlines():
    fields = track.rstrip().split("|")
    file_size = int(fields[3])
    location = fields[4]
    if not tracklist.add_song(file_size, location):
        break


print tracklist
