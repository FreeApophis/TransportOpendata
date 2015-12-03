#
# Transport Factory
#

require 'httparty'
require_relative 'location'
require_relative 'connection'
require_relative 'journey'
require_relative 'error'

module Transport
  class TransportFactory
  
    def self.create(json)
	  json.each do |type, data|
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
          when 'errors'
  		    return data.map do |error|
	  	      Error.new error
		    end
		  else
		    raise ArgumentError.new('Unknown Type: ' + type)
		end
	  end
	end
  end
end