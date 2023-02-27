import 'package:flutter/material.dart';
import 'package:weather_app/Pages/search_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.routeName);
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ))
        ],
        centerTitle: true,
        title: const Text('Weather'),
      ),
      body: Center(
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
      ),
    );
  }
}
