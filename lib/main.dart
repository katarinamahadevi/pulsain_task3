import 'package:flutter/material.dart';
import 'package:pulsain_task3/homepage/splash_screen_page.dart';
import 'package:pulsain_task3/homepage/onboarding_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PulsaIn',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
