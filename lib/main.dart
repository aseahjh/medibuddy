import 'package:flutter/material.dart';
import 'package:medibuddy/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:medibuddy/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:medibuddy/models/user.dart';

void main() async {
  try {
    // Initializing Firebase
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Run App
    runApp(MyApp());
  } catch (error) {
    print('Initializing Firebase Error: $error');
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // Wrapping MaterialApp with StreamProvider to Listen to the Authentication Stream
  // Authentication Steam tells you if there is a User Logged In or not
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // Goes to Wrapper Widget first to check for Authentification
        home: Wrapper(),
      ),
    );
  }
}
