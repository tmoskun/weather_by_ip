require "weather_by_ip/version"
require 'weather_by_ip/weather'
require 'uri'

class WeatherByIp

  class << self
  
      include WeatherInfo
            
      def get_weather location, key = GeoIp.api_key
        if location_ip? location
          weather = Weather.new(Weather.get_results_by_ip(location, :key => key, :weather => :zip_code))
        elsif
          weather = Weather.new(Weather.get_results(:weather => URI.escape(location)))         
        end
        weather
      end
      
private
      def location_ip? loc
        loc =~ /(?:\d{1,3}\.){3}\d{1,3}/
      end
            
  end
end
