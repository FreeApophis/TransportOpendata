#
# Section
#

module Transport
  class Section
    attr_reader :journey, :walk, :departure, :arrival
    
    def initialize(section)
      @journey = Journey.new section['journey']
      @walk = section['walk']
      @departure = Checkpoint.new section['departure']
      @arrival = Checkpoint.new section['arrival']
    end
  end
end