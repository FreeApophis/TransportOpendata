Gem::Specification.new do |s|
  s.name        = 'transport-opendata'
  s.version     = '0.8.2'
  s.date        = '2016-12-03'
  s.summary     = "Swiss Public Transport API"
  s.description = "Access to the Swiss Public Transport API of transport.opendata.ch"
  s.authors     = ["Thomas Bruderer"]
  s.email       = 'apophis@apophis.ch'
  s.files       = Dir['lib/*.rb']
  s.homepage    = 'https://github.com/FreeApophis/TransportOpendata'
  s.license       = 'MIT'
  
  s.add_runtime_dependency 'httparty', '~> 0'
end