import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/Weather_Cubit/weather_cubit.dart';
import 'package:weather_app/Pages/search_page.dart';
import 'package:weather_app/Services/weather_service.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(WeatherService()),
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .getThemeColors(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SearchPage.routeName: (_) => SearchPage(),
      },
    );
  }
}
