import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            // Initialize FlutterFire:
            future: _initialization,
            builder: (context, snapshot) {
              // Check for errors
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              // Once complete, show your application
              if (snapshot.connectionState == ConnectionState.done) {
                return Text('Connected Done!');
              }

              // Otherwise, show something whilst waiting for initialization to complete
              return CircularProgressIndicator(
                backgroundColor: Colors.green,
              );
            },
          ),
        ),
      ),
    );
  }
}
