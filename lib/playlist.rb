#!/usr/bin/env ruby

#USAGE: ./playlist.rb <maximum storage size>

class PlayList

  def initialize(max_size_in_gb)
    raise ArgumentError, "Invalid maximum storage size" unless max_size_in_gb.is_a?(Fixnum) or max_size_in_gb == 0
    @tracks = []
    @max_storage_size = max_size_in_gb * 1024 * 1048576
    @current_size = 0
  end

  def add_song(file_size, location)
    return false if @current_size + file_size > @max_storage_size
    @tracks << location
    @current_size += file_size
    true
  end
  
  def to_s
    @tracks.join
  end

end

max_storage_in_gb = ARGV.shift.to_i rescue 8  #8GB = default

playlist = PlayList.new(max_storage_in_gb)

#album|date_added_to_library|played_count|size_in_bytes|location

ARGF.each_line do |entry|
  fields = entry.split("|")
  file_size = fields[3].to_i
  location = fields[4]
  break unless playlist.add_song(file_size, location) 
end

$stdout.puts playlist.to_s
