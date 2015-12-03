#!/usr/bin/ruby
# CALL ME MAYBE
# ----------------------

require 'pp'
require_relative 'TransportOpenData/client'

client = Transport::Client.new

# pp client.search_station 'Altstetten'
# pp client.search_connection 'Spreitenbach, IKEA', 'Zürich Altstetten'
pp client.board_for 'Altstetten'
