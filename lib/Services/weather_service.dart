import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';

  // String apiKey = 'b38bb987235c42959b820024231803';
  String apiKey = '018a43c8e9404febb13211323230104';
  String apiEndPoint = 'forecast';

  Future<WeatherModel> getWeatherService({required String cityName}) async {
    late WeatherModel weatherModel;
    try {
      Uri url = Uri.parse(
          '$baseUrl/$apiEndPoint.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weatherModel = WeatherModel.fromJson(data);
    } catch (e) {
      print(e.toString());
    }
    return weatherModel;
  }
}
