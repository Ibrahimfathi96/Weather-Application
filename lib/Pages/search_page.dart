// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Providers/weather_providers.dart';
import 'package:weather_app/Services/weather_service.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = 'search-page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String cityName;

  WeatherService service = WeatherService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherModel? weather =
                  await service.getWeatherService(cityName: cityName);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 22, horizontal: 24),
              label: const Text(
                'Search',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () async {
                  WeatherModel? weather =
                      await service.getWeatherService(cityName: cityName);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;
                  Navigator.pop(context);
                },
              ),
              hintText: 'Enter a City',
              hintStyle: const TextStyle(fontSize: 22, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
