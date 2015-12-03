#
# Duration
#

module Transport
  class Duration
    attr_reader :seconds, :minutes, :hours, :days
    
    def initialize(duration)
      @days, @hours, @minutes, @seconds = duration.split(/d|:/)
      @seconds = @seconds.to_i
      @minutes = @minutes.to_i
      @hours = @hours.to_i
      @days = @days.to_i
    end
      
    def to_s
      result = ""
      result += "#{@days}d" if @days > 0
      result += "#{@hours}h" if @hours > 0 || @days > 0
      result += "#{@minutes}m"
    end
  end
end