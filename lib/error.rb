#
# Error
#

module Transport
  class Error
    attr_reader :message
    
    def initialize(error)
      @message = error['message']
    end
  end
end