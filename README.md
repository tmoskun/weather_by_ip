# WeatherByIp

This gem captures weather information based on ip. 

## Installation

Add this line to your application's Gemfile:

    gem 'weather_by_ip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weather_by_ip

## Usage

The gem relies on [ipinfodb.com](http://ipinfodb.com/) webservice to retrieve location based on ip. 

The service requires an API key, in order to get it [register](http://ipinfodb.com/register.php) at the web site. 

Consider making a donation to [ipinfodb.com](http://ipinfodb.com/) at [http://ipinfodb.com/donate.php](http://ipinfodb.com/donate.php).

The gem also uses Google weather service to the weather information by location. It doesn't require any key. 

The weather information then is obtained as the following:

```
WeatherByIp.get_weather(<your ip>, <your ipinfodb_key>)
```

## Limitations

THe location by ip service is free and doesn't always give the correct location. 

## Testing

For the test to be run, the ipinfodb.com api key should be either placed into the test/data/keys/ipinfodb_key.txt file or passed as an environment variable:

```
API_KEY='<your key>' rake test
```

There is no existing api key provided with this gem as per the Terms and Conditions of the ipinfodb service. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
