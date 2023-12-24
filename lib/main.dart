import 'package:flutter/material.dart';
import 'package:suitmedia/SecondScreen.dart';
import 'package:suitmedia/ThirdScreen.dart';
import 'package:suitmedia/FirstScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) {
          final arguments = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return SecondScreen(name: arguments['name']);
        },
        '/third': (context) => ThirdScreen(),
      },
    );
  }
}
