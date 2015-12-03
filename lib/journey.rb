#
# Journey
#

require_relative 'checkpoint'

module Transport
  class Journey
    attr_reader :name, :category, :categoryCode, :number, :operator, :to, :passList, :capacity1st, :capacity2nd
    
	def initialize(journey)
      @name = journey['name']
      @category = journey['category']
      @categoryCode = journey['categoryCode']
      @number = journey['number']
      @operator = journey['operator']
      @to = journey['to']
      @passList = journey['passList'].map { |checkpoint| Checkpoint.new checkpoint }
      @capacity1st = journey['capacity1st']
      @capacity2nd = journey['capacity2nd']    
	end
  end
end