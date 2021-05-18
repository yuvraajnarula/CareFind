import 'package:care_find/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Unable to initialize Firebase');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'CareFind',
            home: Wrapper(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
