import 'package:flutter/material.dart';
import 'package:renting_car/screen/home/home_screen.dart';
import 'package:renting_car/screen/home/splash/splash.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splash()
    );
  }
}