import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '60cf40bd02b17ab1ea2087fe77733bd4';
const baseURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$baseURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper helper = NetworkHelper(url);
    return await helper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    String url = '$baseURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric';
    NetworkHelper helper = NetworkHelper(url);
    // var weatherData = await helper.getData();
    return await helper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
