import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Search Screen',
              style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        ),
      ),
    );
  }
}
