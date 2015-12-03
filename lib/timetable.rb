#
# Locations
#

require 'httparty'
require_relative 'transport_factory'

module Transport
  class Timetable
    include HTTParty
    
    attr_accessor :parse
    
    base_uri 'transport.opendata.ch'
	
    # default_params :output => 'json'
  
    def initialize()
	  @version = 'v1'
      @parse = true
      @options = { query: {  } }
	end
  
    def parse_filter unparsed_result
      if @parse
        TransportFactory::create(unparsed_result)
      else
        unparsed_result
      end
    end
  
    def search_station station_partial
      parse_filter(self.class.get(restful_url('locations'), @options.merge(query: { query: station_partial})))
    end
	
	def search_connection from, to
      parse_filter(self.class.get(restful_url('connections'), @options.merge(query: { from: from, to: to})))
    end
	
    def board_for station
      parse_filter(self.class.get(restful_url('stationboard'), @options.merge(query: { station: station, limit: 1})))
    end
    
    private
    def restful_url page
      "/#{@version}/#{page}"
    end 
 end
end