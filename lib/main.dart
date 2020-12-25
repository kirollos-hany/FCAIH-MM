import 'package:flutter/material.dart';
//import 'views/splash.dart';
import 'views/matching.dart';
import './constants/strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MatchingGameView(),
    );
  }
}