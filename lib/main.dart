import 'package:flutter/material.dart';
import 'package:mausam/pages/home.dart';
import 'package:mausam/pages/loading.dart';
import 'package:mausam/pages/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Know Your Mausam',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/home': (context) => Home(),
        '/location': (context) => Location(),
        '/': (context) => Loading(),
        '/loading': (context) => Loading(),
      },
    );
  }
}
