import 'package:flutter/material.dart';
import 'package:medibuddy/models/user.dart';
import 'package:medibuddy/screens/authenticate/authenticate.dart';
import 'package:medibuddy/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing User Data from Authentication Stream Provider everytime we get a New Value
    final user = Provider.of<AppUser?>(context);

    // If User Value is Null => User is Logged Out; Goes to Authenticate Widget for Sign Up
    // Else => User is Logged In; Goes to Home Widget
    if (user == null) {
      return Authenticate();
    } else {
      //return home screen once working
      return Home();
    }
  }
}
