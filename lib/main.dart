import 'dart:async';
import 'package:flukey_hackathon/screens/home_page.dart';
import 'package:flukey_hackathon/screens/onboarding_screen/onboarding_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hackathon',
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    var prefs = await SharedPreferences.getInstance();
    var _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      //TODO _seen'i değiştirmeyi unutma
      await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      await prefs.setBool('seen', true);
      await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnboardingScreenView()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CircularProgressIndicator(),
    );
  }
}
