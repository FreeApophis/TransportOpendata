# TransportOpendata

Access to the Swiss Public Transport API of transport.opendata.ch

Simple library which gives direct Object Oriented Access to the bare information returned by the API of transport.opendata.ch

Howto:

```ruby
require 'TransportOpenData'

timetable = Transport::Timetable.new

connections = timetable.search_connection 'Zürich', 'Basel'
station = timetable.search_station 'Zürich Altstetten'
stationboard = timetable.board_for 'Zürich Altstetten'
```