#
# Checkpoint
#

require_relative 'location'
require_relative 'prognosis'

module Transport
  class Checkpoint
    attr_reader :station, :arrival, :departure, :platform, :prognosis
    
	def initialize(checkpoint)
      return unless checkpoint
      
	  @station = Location.new checkpoint['station']
      @arrival = DateTime.parse(checkpoint['arrival']) if checkpoint['arrival']
      @departure = DateTime.parse(checkpoint['departure']) if checkpoint['departure']
      @platform = checkpoint['platform']
      @prognosis = Prognosis.new checkpoint['prognosis']
	end
  end
end