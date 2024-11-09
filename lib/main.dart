import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/pages/main_page.dart';
import 'package:mobile_programming_ca224/resources/colors.dart';
import 'package:mobile_programming_ca224/resources/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          secondary: secondaryColor,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const MainPage(),
    );
  }
}
