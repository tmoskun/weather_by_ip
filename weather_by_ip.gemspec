# -*- encoding: utf-8 -*-
require File.expand_path('../lib/weather_by_ip/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["tmoskun"]
  gem.email         = ["tanyamoskun@gmail.com"]
  gem.description   = %q{An interface to load weather information based on an approximate user location}
  gem.summary       = %q{An interface to load weather information based on an approximate user location}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "weather_by_ip"
  gem.require_paths = ["lib"]
  gem.version       = WeatherByIp::VERSION
  
  gem.add_development_dependency "minitest"
  gem.add_dependency('geo_ip') 
  gem.add_dependency('api_object', '>= 0.3')
  
end
