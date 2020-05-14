import 'package:flutter/material.dart';
import 'package:flutter_push_notification/pages/home-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: "FCM",
      home: MyHomePage(),
    );
  }
}
