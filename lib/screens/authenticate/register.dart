import 'package:flutter/material.dart';
import 'package:medibuddy/screens/shared/loading.dart';
import 'package:medibuddy/services/auth.dart';
import 'package:medibuddy/screens/shared/constants.dart';

class Register extends StatefulWidget {
  // Register Widget with Constructor to accept ToggleView Function
  final Function toggleView;
  Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // AuthService Class to call Functions from auth.dart
  final AuthService _auth = AuthService();

  // Global Key for Register Form
  // Used to Identify the form
  final _formKey = GlobalKey<FormState>();

  // Loading Icon Flag
  bool loading = false;

  // Text field state
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

            // App Bar showing Page Title and Sign In Button
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: const Text('Sign Up to MediBuddy'),

              // Button to go to Sign In Page
              actions: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                  onPressed: () {
                    widget.toggleView();
                  },
                ),
              ],
            ),

            // Register Container for Form
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                // Setting Key of Form to be Global Key _formKey
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

                  // Register Button
                  // When Button is Pressed, Check if the Current State of the Form is Valid using Validators
                  // if Valid, Register a New User in Firebase using Function registerWithEmailAndPassword from auth.dart and go to Home Page
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[400],
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Server Error. Please try again.';
                            loading = false;
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20.0),

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
