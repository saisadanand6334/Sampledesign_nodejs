import 'package:flutter/material.dart';
import 'package:renting_car/files/login.dart';
import 'package:renting_car/screen/home/home_screen.dart';



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(
      Duration(seconds: 4),
          () {},
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Log()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(fit: BoxFit.cover,
          image: AssetImage('assets/splash/lega.jpg',),
        ),
      ),
    );
  }
}
