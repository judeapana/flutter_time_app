import 'package:flutter/material.dart';
import 'package:weather_app/pages/chooseLocation.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/home': (context) => Home(),
        '/': (context) => Loading(),
        '/location': (context) => ChooseLocation(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
