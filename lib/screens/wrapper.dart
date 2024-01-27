import 'package:flutter/material.dart';
import 'package:medibuddy/models/user.dart';
import 'package:medibuddy/screens/authenticate/authenticate.dart';
import 'package:medibuddy/screens/home/home.dart';
import 'package:provider/provider.dart';
//import 'package:medibuddy/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // accessing user data from provider everytime we get a new value
    //final user = Provider.of<AppUser>(context);

    // return either Home or Authenticate; if user value is null => user is logged out
    return Authenticate();

    /*if (user == null) {
      return Authenticate();
    } else {
      return MyHomePage();
    }*/
  }
}
