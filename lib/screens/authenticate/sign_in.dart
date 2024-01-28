import 'package:flutter/material.dart';
import 'package:medibuddy/services/auth.dart';

class SignIn extends StatefulWidget {
  // SignIn Widget with Constructor to accept ToggleView Function
  final Function toggleView;
  SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // AuthService Class to call Functions from auth.dart
  final AuthService _auth = AuthService();

  // Text Field Inputs
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],

      // App Bar showing Page Title and Register Button
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sign In to MediBuddy'),
        // Button to go to Register Page
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),

      // Sign In Container for Form
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),

            // Email Input
            TextFormField(
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            SizedBox(height: 20.0),

            // Password Input
            TextFormField(
              obscureText: true,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            SizedBox(height: 20.0),

            // Sign In Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[400],
              ),
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(email);
                print(password);
              },
            ),
          ]),
        ),
      ),
    );
  }
}

// ADD THIS BUTTON TO SIGN IN VIA GOOGLE 

// ADD THIS BUTTON TO ANONYMOUSLY SIGN IN 
/*ElevatedButton(
  child: const Text('Sign In Anonymously'),
  onPressed: () async {
    dynamic result = await _authService.signInAnon();
    if (result == null) {
      print('Error Signing In');
    } else {
      print('Signed In');
      print(result.uid);
    }
  }),*/