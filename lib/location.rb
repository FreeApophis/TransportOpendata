#
# Locations
#

require_relative 'coordinate'

module Transport
  class Location
    attr_reader :id, :type, :name, :score, :coordinate, :distance
    
	def initialize(location)
	  @id = location['id']
	  @type = location['type']
	  @name = location['name']
	  @score = location['score']
	  @coordinate = Coordinate.new location['coordinate']
	  @distance = location['distance']
	end
  end
end