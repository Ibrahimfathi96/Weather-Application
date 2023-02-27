import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static const String routeName = 'search-page';

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
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                label: const Text(
                  'Search',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                hintText: 'Enter a City',
                hintStyle: const TextStyle(fontSize: 22, color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ),
    );
  }
}
