import 'package:flutter/material.dart';
import 'package:medibuddy/screens/authenticate/register.dart';
import 'package:medibuddy/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  // Boolean to check whether to show Sign In Widget or Register Widget
  bool showSignIn = true;

  // Function to Change Boolean to its Opposite Value
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
