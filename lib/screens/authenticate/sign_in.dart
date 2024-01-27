import 'package:flutter/material.dart';
import 'package:medibuddy/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sign in to MediBuddy'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
            child: const Text('Sign In Anonymously'),
            onPressed: () async {
              dynamic result = await _authService.signInAnon();
              if (result == null) {
                print('Error Signing In');
              } else {
                print('Signed In');
                print(result.uid);
              }
            }),
      ),
    );
  }
}
