#!/usr/bin/osascript

on formatIsoDate(dt)
	set y to text -4 thru -1 of ("0000" & (year of dt))
	set m to text -2 thru -1 of ("00" & ((month of dt) as integer))
	set d to text -2 thru -1 of ("00" & (day of dt))
	return y & "-" & m & "-" & d
end formatIsoDate

    
set track_list to ""

#line format: album|date_added|played_count|size_in_bytes|location\n

tell application "iTunes"
	repeat with curr_track in tracks of library playlist 1
		set song_size to size of curr_track
                set date_added to my formatIsoDate(date added of curr_track)
		set entry to album of curr_track & "|" & date_added & "|" & played count of curr_track & "|" & song_size & "|" & location of curr_track & "\n"
		set track_list to track_list & entry
	end repeat
end tell

return track_list