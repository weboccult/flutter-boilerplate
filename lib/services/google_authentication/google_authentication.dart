import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';


class GoogleAuth  {

  static final GoogleAuth _auth = GoogleAuth._internal();

  factory GoogleAuth() {
    return _auth;
  }

  GoogleAuth._internal();



  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      "https://www.googleapis.com/auth/userinfo.profile"
    ],
  );

  Future<GoogleSignInAccount?>? getGoogleUser() async {
    googleSignOut();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // kLog("GoogleSignInAuthentication -> $googleAuth");
    // final headers = await googleUser.authHeaders;
    return googleUser;
  }

  Future<bool> googleSignOut() async {
    try {
      await _googleSignIn.signOut();
      return true;
    } catch(e) {
      log("google sign-out error -> $e");
    }
    return false;
  }
}
