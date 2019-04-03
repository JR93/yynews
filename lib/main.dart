import 'package:flutter/material.dart';

import './pages/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YY News',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color.fromARGB(255, 255, 221, 0),
        cursorColor: Color.fromARGB(255, 255, 221, 0),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromARGB(255, 255, 221, 0)
        ),
      ),
      home: HomePage(),
    );
  }
}