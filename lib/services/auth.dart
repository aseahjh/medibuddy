import 'package:firebase_auth/firebase_auth.dart';
import 'package:medibuddy/models/user.dart';

class AuthService {
  // FirebaseAuth Class to call FirebaseAuth Functions
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create Custom User Object based on Firebase User Unique ID
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // Authentication Stream to Get Usera when there is Authentication Change
  Stream<AppUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  // Function to Sign In Anonymously and Return Custom User Object
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Sign In with Email and Password

  // Fucntion to Register with Email and Password and Return Custom User Object
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Function to Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
