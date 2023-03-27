import 'package:weather_app/Models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherDataLoading extends WeatherState {}

class WeatherLoadingSuccess extends WeatherState {
  WeatherModel weatherModel;

  WeatherLoadingSuccess({required this.weatherModel});
}

class WeatherLoadingFailure extends WeatherState {}
