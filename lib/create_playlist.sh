#!/bin/sh

/usr/bin/osascript <<EOF
set trackList to read POSIX file "/tmp/plboogie_out" as «class utf8» using delimiter linefeed
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

rm -f /tmp/plboogie_out
