#
# Checkpoint
#

require 'httparty'

module Transport
  class Checkpoint
    attr_reader :station, :arrival, :departure, :platform, :prognosis
    
	def initialize(checkpoint)
	  @station = Location.new checkpoint['station']
      @arrival = checkpoint['arrival']
      @departure = checkpoint['departure']
      @platform = checkpoint['platform']
      @prognosis = Prognosis.new checkpoint['prognosis']
	end
  end
end