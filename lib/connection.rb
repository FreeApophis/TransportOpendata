#
# Connection
#

require_relative 'checkpoint'
require_relative 'service'
require_relative 'section'
require_relative 'duration'

module Transport
  class Connection
    attr_reader :from, :to, :duration, :service, :products, :capacity1st, :capacity2nd, :sections
    
    def initialize(connection)
      @from = Checkpoint.new connection['from']
      @to = Checkpoint.new connection['to']
      @duration = Duration.new connection['duration']
      @service = Service.new connection['service']
      @products = connection['products']
      @capacity1st = connection['capacity1st']
      @capacity2nd = connection['capacity2nd']
      @sections = connection['sections'].map { |section| Section .new section }
    end
  end
end