#!/usr/bin/ruby

# Swiss Timetable Command Line
# ----------------------------
#
require_relative 'lib/transport_opendata'
# require 'transport_opendata'
require 'optparse'
require 'terminal-table'

require 'pp'

OptionParser.new do |opts|
  opts.banner = "Usage: Timetable.rb [OPTIONS] [Station]"
  opts.on("-t", "--time", "On what time") do
    options[:force] = true
  end
  opts.on("-h", "--help", "This Help") do |h|
    puts opts.help();
    exit 0;
  end

  opts.separator("")
  opts.separator("Example:")
  opts.separator("  Timetable.rb")
  opts.separator("")

end.parse!

from = ARGV[0].dup.encode("utf-8")
to = ARGV[1].dup.encode("utf-8")

t = Transport::Timetable.new

connections = t.search_connection from, to

if connections.first.is_a? Transport::Error
  STDERR.puts connections.first.message
  exit 99
end

table = Terminal::Table.new :headings => [from, 'PL', to, 'PL','Duration'] do |t| 
  connections.each do |c| 
    t.add_row [
    c.from.departure.strftime("%H:%M"), 
    c.from.platform,
    c.to.arrival.strftime("%H:%M"), 
    c.to.platform,
    c.duration,
    c.products.join(',')]  
  end
end

puts table