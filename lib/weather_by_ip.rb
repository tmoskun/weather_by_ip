require "weather_by_ip/version"
require 'weather_by_ip/weather'

class WeatherByIp

  class << self
  
      def api_key=(key)
        GeoIp.api_key = key
      end
            
      def get_weather ip
        location = GeoIp.geolocation(ip)
        Weather.new(:weather => location.zip_code)
        rescue
          puts "Cannot obtain location or weather. Verify that you've obtained and set the api_key for ipinfodb.com webservice"
      end
            
  end
end
