require 'minitest/autorun'
require 'api_object'
require 'weather_by_ip'
require 'weather_by_ip/weather'

class WeatherByIpTest < MiniTest::Unit::TestCase
    include WeatherInfo

    puts ARGV
    
    
    def test_should_get_correct_weather
        weather = Weather.new(:weather => 'San+Mateo')
        assert_equal(weather.forecast_information.city, "San Mateo")
    end

end