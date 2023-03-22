import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Pages/search_page.dart';
import 'package:weather_app/Providers/weather_providers.dart';

import '../Models/weather_model.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: weatherData?.getThemeColors(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SearchPage.routeName,
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ))
        ],
        centerTitle: true,
        title: const Text('Weather'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no weather 😔',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              // color: weatherData!.getThemeColors(),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColors(),
                  weatherData!.getThemeColors()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    weatherData!.date.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text('${weatherData!.temp.toInt()}',
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)),
                      Column(
                        children: [
                          Text('max.temp: ${weatherData!.maxTemp.toInt()}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                          Text('min.temp: ${weatherData!.minTemp.toInt()}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(weatherData!.condition,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold)),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
