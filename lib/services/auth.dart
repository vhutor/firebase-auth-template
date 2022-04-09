import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  Future<User?> signInAnonymously();

  Future<User?> signInWithGoogle();

  Future<User?> singInWithFacebook();

  Future<void> signOut();

  Stream<User?> authStateChanges();

  User? get currentUser;
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> signInAnonymously() async {
    final userCredentials = await _firebaseAuth.signInAnonymously();
    return userCredentials.user;
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogIn = FacebookLogin();
    await facebookLogIn.logOut();
    return _firebaseAuth.signOut();
  }

  @override
  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredentials = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken));
        return userCredentials.user;
      }
    } else {
      throw FirebaseAuthException(
          code: "ABORTED BY USER", message: "Sign in was aborted by user");
    }
  }

  @override
  Future<User?> singInWithFacebook() async {
    final fb = FacebookLogin();
    final response = await fb.logIn(
      permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ],
    );
    switch (response.status) {
      case FacebookLoginStatus.success:
        final accessToken = response.accessToken;
        final userCredential = await _firebaseAuth.signInWithCredential(
            FacebookAuthProvider.credential(accessToken!.token));
        return userCredential.user;
      case FacebookLoginStatus.cancel:
        throw FirebaseAuthException(
            code: "ABORTED BY USER", message: "Sign in was aborted by user");
      case FacebookLoginStatus.error:
        throw FirebaseAuthException(
            code: "ABORTED BY USER", message: "Sign in was aborted by user");
    }
  }
}
