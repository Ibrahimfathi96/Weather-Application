import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/Weather_Cubit/weather_cubit.dart';
import 'package:weather_app/Bloc/Weather_Cubit/weather_state.dart';
import 'package:weather_app/Pages/search_page.dart';

import '../Models/weather_model.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home-page';
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .getThemeColors(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SearchPage.routeName,
                );
              },
              icon: Icon(
                Icons.search,
                size: 30,
              ))
        ],
        centerTitle: true,
        title: const Text('Weather'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherLoadingSuccess) {
            return SuccessWidgetBody(weatherData: state.weatherModel);
          } else if (state is WeatherLoadingFailure) {
            return const FailureBody();
          } else {
            return const DefaultBody();
          }
        },
      ),
    );
  }
}

class SuccessWidgetBody extends StatelessWidget {
  WeatherModel? weatherData;

  SuccessWidgetBody({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            weatherData!.date.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
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
              style:
                  const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}

class FailureBody extends StatelessWidget {
  const FailureBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: Text('   Something Went Wrong 😕   '),
        ),
        Center(
          child: Text('Please try again'),
        ),
      ],
    );
  }
}

class DefaultBody extends StatelessWidget {
  const DefaultBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
