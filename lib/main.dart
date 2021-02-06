import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(home: AuthenticationWrapper()),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  AuthenticationWrapper({Key key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
