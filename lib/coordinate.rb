#
# Coordinate
#

module Transport
  class Coordinate
    attr_reader :type, :x, :y
    
	def initialize(coordinate)
	  @type = coordinate['type'].to_sym
	  @x = coordinate['x']
	  @y = coordinate['y']
	end
  end
end