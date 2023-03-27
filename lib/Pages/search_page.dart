import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/Weather_Cubit/weather_cubit.dart';
import 'package:weather_app/Services/weather_service.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = 'search-page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? cityName;

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
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
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
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeather(cityName: cityName!);
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
