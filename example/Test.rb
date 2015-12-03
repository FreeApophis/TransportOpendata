#!/usr/bin/ruby
# CALL ME MAYBE
# ----------------------

require 'pp'
require 'transport-opendata'

timetable = Transport::Timetable.new

pp timetable.search_station 'Altstetten'
pp timetable.search_connection 'Spreitenbach, IKEA', 'Zürich Altstetten'
pp timetable.board_for 'Altstetten'
