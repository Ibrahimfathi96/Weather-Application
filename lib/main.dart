import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Pages/search_page.dart';
import 'package:weather_app/Providers/weather_providers.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(), child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context)
                .weatherData
                ?.getThemeColors(),
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
