import 'package:flutter/material.dart';
import 'package:medibuddy/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  try {
    await Firebase.initializeApp();
    runApp(MyApp());
  } catch (error) {
    print("Error Initializing Firebase: $error");
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Wrapper(),
    );
  }
}
