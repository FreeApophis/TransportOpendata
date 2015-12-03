#
# Prognosis
#

module Transport
  class Prognosis
    attr_reader :platform, :departure, :arrival, :capacity1st, :capacity2nd
    
	def initialize(prognosis)
      return unless prognosis

      @platform = prognosis['platform']
      @departure = DateTime.parse prognosis['departure'] if prognosis['departure'] 
      @arrival = DateTime.parse prognosis['arrival'] if prognosis['arrival'] 
      @capacity1st = prognosis['capacity1st']
      @capacity2nd = prognosis['capacity2nd']
	end
  end
end