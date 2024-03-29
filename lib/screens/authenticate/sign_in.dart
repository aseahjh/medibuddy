import 'package:flutter/material.dart';
import 'package:medibuddy/screens/shared/loading.dart';
import 'package:medibuddy/services/auth.dart';
import 'package:medibuddy/screens/shared/constants.dart';

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

  // Global Key for Register Form
  // Used to Identify the form
  final _formKey = GlobalKey<FormState>();

  // Loading Icon Flag
  bool loading = false;

  // Text Field Inputs
  String email = '';
  String password = '';

  // Error String Output
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),

                  // Email Input
                  // Has Validator that Checks if the Input Field is Empty or Email Input is Invalid
                  // Validator Returns null if Input Field is Valid
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Example@gmail.com'),
                    validator: (val) =>
                        val!.isEmpty || !val.endsWith('@gmail.com')
                            ? 'Enter a valid Email: example@gmail.com'
                            : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),

                  // Password Input
                  // Has Validator that Checks if the Input Field is Empty or Password Input is Invalid
                  // Validator Returns null if Input Field is Valid
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Password1234'),
                    obscureText: true,
                    validator: (val) => val!.isEmpty || val.length < 8
                        ? 'Enter a valid Password of at least 8 characters'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),

                  // Sign In Button
                  // When Button is Pressed, Check if the Current State of the Form is Valid using Validators
                  // if Valid, Sign In the User in Firebase using Function signInWithEmailAndPassword from auth.dart and go to Home Page
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[400],
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            error =
                                'Unable to Sign In with those Credentials. Please try again.';
                            loading = false;
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20.0),

                  // I AM NOT SURE IF THIS IS THE CORRECT WAY TO ADD THIS BUTTON TO SIGN IN VIA GOOGLE
                  /*ElevatedButton(
                    child: const Text('Sign In with Google'),
                    onPressed: () async {
                      setState(() => loading = true);
                      dynamic result = await _authService.signInWithGoogle();
                      if (result == null) {
                        setState(() {
                          error =
                              'Unable to Sign In with those Credentials. Please try again.';
                          loading = false;
                        });
                      }
                    }
                  ),*/

                  // I AM NOT SURE IF THIS IS THE CORRECT WAY TO ADD THIS BUTTON TO SIGN IN ANONYMOUSLY
                  /*ElevatedButton(
                    child: const Text('Sign In Anonymously'),
                    onPressed: () async {
                      setState(() => loading = true);
                      dynamic result = await _authService.signInAnon();
                      if (result == null) {
                        setState(() {
                          error =
                              'Unable to Sign In with those Credentials. Please try again.';
                          loading = false;
                        });
                      } 
                    }
                  ),*/

                  // If there is an Error with Register a New User, Show the Error Message on the Screen
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ]),
              ),
            ),
          );
  }
}
