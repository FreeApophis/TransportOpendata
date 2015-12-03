#
# Service
#

module Transport
  class Service
    attr_reader :regular, :irregular
    
	def initialize(service)
      @regular = service['regular']
      @irregular = service['irregular']
	end
  end
end