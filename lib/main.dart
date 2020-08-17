import 'package:flutter/material.dart';
import 'package:sosNews/screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Paper',
      theme: ThemeData(
        primaryColor: Colors.red,
        cursorColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
