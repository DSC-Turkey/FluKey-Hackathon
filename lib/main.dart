import 'dart:async';

import 'package:flukey_hackathon/screens/home_page.dart';
import 'package:flukey_hackathon/screens/login_screen/login_screen_view.dart';
import 'package:flukey_hackathon/screens/onboarding_screen/onboarding_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/service_locator.dart';
import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() async {
  Bloc.observer = SimpleBlocObserver();
  setupLocator();
  runApp(MyApp());
}

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
      await Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              LoginScreenView())); //TODO değiştir homepage yap
    } else {
      await prefs.setBool('seen', true);
      await Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreenView()));
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
      body: CircularProgressIndicator(),
    );
  }
}
