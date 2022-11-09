import 'dart:developer';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';


class AppleAuth {
  static final AppleAuth _auth = AppleAuth._internal();

  factory AppleAuth() {
    return _auth;
  }

  AppleAuth._internal();


  Future<AuthorizationCredentialAppleID?>? appleSignIn() async {
    try {
      if (await SignInWithApple.isAvailable()) {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
        log("Apple Credentials are -> ${credential.email} :: ${credential.givenName} "" ${credential.userIdentifier}");
        return credential;
      }
    } catch(e) {
      log("apple sign-in error -> $e");
    }
    return null;
  }
}
