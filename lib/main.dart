import 'package:camera_app/Pages/servicepage.dart';
import 'package:camera_app/Pages/weatherpage.dart';
import 'package:flutter/material.dart';
import 'package:camera_app/Pages/welcomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CameraApp',
      home: const WelcomePage(),
      routes: {
        "/welcomepage": (_) => const WelcomePage(),
        "/weatherpage": (_) => const WeatherPage(),
        "/servicepage": (_) => const ServicesPage(),
      },
    );
  }
}
