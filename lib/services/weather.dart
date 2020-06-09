
import 'package:http/http.dart';

import '../services/location.dart';
import 'networking.dart';
const String apikey="4b72c0800063264d9d6444293330542e";
class WeatherModel {

String city="Ghaziabad";



  Future<String> getData() async{


    Location location=Location();
    await location.getLocation();

    double lat=location.latitude;

    double lon=location.longitude;

    NetworkHelper networkHelper=NetworkHelper(url: "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey");

    Response response=await networkHelper.getData();

    if(response.statusCode==404)
      {
        String s="";
        return s;
      }

    else
      {
        return response.body;
      }

  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
