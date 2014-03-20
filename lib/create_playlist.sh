#!/bin/sh

#Usage ./create_playlist.sh <playlist_name> <source tracklist path>

/usr/bin/osascript <<EOF
set trackList to read POSIX file "$2" as «class utf8» using delimiter linefeed
set errors to {}

tell application "iTunes"
  try
    delete user playlist "$1"
  end try
  make new user playlist with properties {name:"$1"}
  try
    add trackList to user playlist "$1"
  on error errText
    set errors to errors & errText
  end try
end tell

return errors

EOF
