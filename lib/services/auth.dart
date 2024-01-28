import 'package:firebase_auth/firebase_auth.dart';
import 'package:medibuddy/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebase user
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // return app users when there is auth change over the firebase user stresm
  Stream<AppUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  // sign in anonymously
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

  // sign in with email and pwd

  //register with email and pwd

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }
}
