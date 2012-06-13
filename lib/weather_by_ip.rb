require "weather_by_ip/version"
require 'weather_by_ip/weather'

class WeatherByIp

  class << self
  
      include WeatherInfo
            
      def get_weather ip, key
        Weather.new(Weather.get_results_by_ip(ip, key, :weather => :zip_code))
        rescue
          puts "Cannot obtain location or weather. Verify that you've obtained and set the api_key for the ipinfodb.com webservice"
          return
      end
            
  end
end
