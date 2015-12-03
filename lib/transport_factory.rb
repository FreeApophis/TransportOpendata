#
# Transport Factory
#

require 'httparty'
require_relative 'location'
require_relative 'connection'
require_relative 'journey'

module Transport
  class TransportFactory
  
    def self.create(json)
	  json.each do |type, data|
	    puts type
	    case type
		  when 'stations'
  		    return data.map do |station|
	  	      Location.new station
		    end
		  when 'connections'
  		    return data.map do |connection|
	  	      Connection.new connection
		    end
          when 'station'
            next
          when 'stationboard'
  		    return data.map do |journey|
	  	      Journey.new journey
		    end
		  else
		    raise ArgumentError.new('Unknown Type')
		end
	  end
	end
  end
end