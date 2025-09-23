import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      routes: {
        '/main': (context) => MainScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}