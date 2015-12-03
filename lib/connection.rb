#
# Connection
#

require_relative 'checkpoint'
require_relative 'service'
require_relative 'prognosis'

module Transport
  class Connection
    attr_reader :from, :to, :duration, :service, :products, :capacity1st, :capacity2nd, :prognosis
    
    def initialize(connection)
      @from = Checkpoint.new connection['from']
      @to = Checkpoint.new connection['to']
      @duration = connection['duration']
      @service = Service.new connection['service']
      @products = connection['products']
      @capacity1st = connection['capacity1st']
      @capacity2nd = connection['capacity2nd']
      @prognosis = Prognosis.new connection['prognosis']
    end
  end
end