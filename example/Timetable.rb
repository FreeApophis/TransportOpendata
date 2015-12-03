#!/usr/bin/ruby

# Swiss Timetable Command Line
# ----------------------------
#

require 'transport-opendata'
require 'optparse'
require 'terminal-table'

require 'pp'

options = { stationboard: false }

OptionParser.new do |opts|
  opts.banner = "Usage: Timetable.rb [OPTIONS] [Station]"
  opts.on("-t", "--time", "On what time") do
    options[:force] = true
  end
  opts.on("-h", "--help", "This Help") do |h|
    puts opts.help();
    exit 0;
  end
  opts.on("-s", "--stationboard", "") do
    options[:stationboard] = true
  end

  opts.separator("")
  opts.separator("Example:")
  opts.separator("  Timetable.rb")
  opts.separator("")

end.parse!

t = Transport::Timetable.new

if options[:stationboard]
  station = ARGV[0].dup.encode("utf-8")
  board = t.board_for station
  
  table = Terminal::Table.new :headings => ['Abfahrt', 'Platform', 'Line', 'Richtung', 'Operation'] do |t| 
    board.each do |j| 
     t.add_row [
       j.stop.departure.strftime('%H:%M'), 
       j.stop.prognosis.platform, 
       j.name,
       j.to,
       j.operator
     ]
    end
  end

  puts table
  exit 0
end

from = ARGV[0].dup.encode("utf-8")
to = ARGV[1].dup.encode("utf-8")


connections = t.search_connection from, to

if connections.first.is_a? Transport::Error
  STDERR.puts connections.first.message
  exit 99
end

table = Terminal::Table.new :headings => ['Bhf/Halt', 'Gleis', 'Zeit', 'Zug'] do |t| 
  connections.each do |c| 
    c.sections.map do |s| 
      t.add_row [
        s.departure.station.name, 
        "#{s.departure.prognosis.platform}(#{s.departure.platform})", 
        "#{s.departure.prognosis.departure.strftime("%H:%M") if s.departure.prognosis.departure}(#{s.departure.departure.strftime("%H:%M")})",
        s.journey.name || "Walk"
      ]
      
      t.add_row [
        s.arrival.station.name, 
        "#{s.arrival.prognosis.platform}(#{s.arrival.platform})", 
        "#{s.arrival.prognosis.arrival.strftime("%H:%M") if s.arrival.prognosis.arrival}(#{s.arrival.arrival.strftime("%H:%M")})",
        s.journey.name || "Walk"
      ]
    end
    t.add_separator unless (connections.last == c)
  end
end

puts table