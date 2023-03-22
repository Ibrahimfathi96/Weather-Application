import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String condition;

  //Icon icon;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      //required this.icon,
      required this.condition});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        //icon: jsonData['condition']['icon'],
        condition: jsonData['condition']['text']);
  }

  String getImage() {
    if (condition == 'Thunderstorm' ||
        condition == 'Thunder' ||
        condition == 'Partly cloudy' ||
        condition == 'Fog') {
      return 'assets/images/thunderstorm.png';
    } else if (condition == 'Clear' ||
        condition == 'Light Cloud' ||
        condition == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Light snow' ||
        condition == 'Blowing snow' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Hail' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Thundery outbreaks possible') {
      return 'assets/images/snow.png';
    } else if (condition == 'Heavy Cloud' ||
        condition == 'Cloudy' ||
        condition == 'Overcast') {
      return 'assets/images/cloudy.png';
    } else if (condition == 'Light Rain' ||
        condition == 'Moderate rain' ||
        condition == 'Heavy Rain' ||
        condition == 'Mist' ||
        condition == 'Showers' ||
        condition == 'Patchy rain possible') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColors() {
    if (condition == 'Thunderstorm' ||
        condition == 'Thunder' ||
        condition == 'Partly cloudy' ||
        condition == 'Fog') {
      return Colors.blueGrey;
    } else if (condition == 'Clear' ||
        condition == 'Light Cloud' ||
        condition == 'Sunny') {
      return Colors.orange;
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Light snow' ||
        condition == 'Blowing snow' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Hail' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Thundery outbreaks possible') {
      return Colors.blue;
    } else if (condition == 'Heavy Cloud' ||
        condition == 'Cloudy' ||
        condition == 'Overcast') {
      return Colors.blueGrey;
    } else if (condition == 'Light Rain' ||
        condition == 'Moderate rain' ||
        condition == 'Heavy Rain' ||
        condition == 'Mist' ||
        condition == 'Showers' ||
        condition == 'Patchy rain possible') {
      return Colors.grey;
    } else {
      return Colors.orange;
    }
  }

  @override
  String toString() {
    return 'avg.temp = $temp, max.temp = $maxTemp, data = $date, ';
  }
}
