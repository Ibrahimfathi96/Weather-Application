import 'package:flutter/material.dart';
import 'package:weather_app/Pages/search_page.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SearchPage.routeName: (_) => SearchPage(),
      },
    );
  }
}
