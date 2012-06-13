require "weather_by_ip/version"
require 'weather_by_ip/weather'

class WeatherByIp

  class << self
  
      include WeatherInfo
            
      def get_weather ip, key = GeoIp.api_key
        Weather.new(Weather.get_results_by_ip(ip, :key => key, :weather => :zip_code))
      end
            
  end
end
