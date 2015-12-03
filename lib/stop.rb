#
# Stop
#

module Transport
  class Stop
    attr_reader :station, :name, :category, :number, :operator, :to
    
	def initialize(stop)
      return unless stop
      
      @station = Location.new stop['station']
      @name = stop['name']
      @category = stop['category']
      @number = stop['number']
      @operator = stop['operator']
      @to = stop['to']
	end
  end
end