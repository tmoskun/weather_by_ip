require 'minitest/autorun'
require 'weather_by_ip'
require 'weather_by_ip/weather'

class WeatherByIpTest < MiniTest::Unit::TestCase  
    
    IP = '99.156.82.20'
 
    def test_should_get_correct_weather_by_ip
        check_weather WeatherByIp.get_weather(IP, ARGV.last)
    end
    
    def test_should_get_correct_weather_with_key_preset
        GeoIp.api_key = ARGV.last
        check_weather WeatherByIp.get_weather(IP)
    end
    
    def test_should_get_correct_weather_by_location
        check_weather WeatherByIp.get_weather('78744')
        check_weather WeatherByIp.get_weather('San Jose, CA'), 'San Jose, CA'
    end
    
    def test_should_get_empty_weather_with_key_missing
        GeoIp.api_key = nil
        weather = WeatherByIp.get_weather(IP)
        assert_empty(weather, "weather object should be empty")
    end
    
    def test_should_get_empty_weather_with_incorrect_location
        weather = WeatherByIp.get_weather('999999')
        assert_empty(weather, "weather object should be empty")
    end
    
private
    def check_weather weather, city = 'Austin, TX'
       unless weather.nil?
          refute_nil(weather.forecast_information)
          refute_nil(weather.current_conditions)
          refute_nil(weather.forecast_conditions)
          assert_equal(weather.forecast_information.city, city)
          assert_equal(weather.forecast_information.current_date, Date.today.to_s)
          assert_match(/^\/ig\/images\/weather\/.+\.gif/, weather.current_conditions.icon)
          assert(weather.forecast_conditions.size > 3)
          assert_equal(weather.forecast_conditions[1].day_of_week, Date.tomorrow.strftime("%a"))
          assert_match(/^\/ig\/images\/weather\/.+\.gif/, weather.forecast_conditions[1].icon)
        end
    end

end