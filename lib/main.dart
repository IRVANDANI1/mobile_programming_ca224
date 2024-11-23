import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/provider/provider.dart';
import 'package:mobile_programming_ca224/provider/country_provider.dart';
import 'package:mobile_programming_ca224/screens/home_screen.dart';
import 'package:mobile_programming_ca224/models/country.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountryProvider()..loadInitialData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
