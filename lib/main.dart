import 'package:flutter/material.dart';
import 'package:incheg_events/onboarding/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Incheg events',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // routes: null,
    );
  }
}

