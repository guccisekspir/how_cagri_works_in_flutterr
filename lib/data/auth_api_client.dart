import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:how_cagri_work_on_flutter/data/database_api_client.dart';
import 'package:how_cagri_work_on_flutter/locator.dart';
import 'package:how_cagri_work_on_flutter/models/kipss_user.dart';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/*
* This client just communicate with Firebase Auth and FireStore API
!Firstly Save User when created with email pass
!Second Save User when completed Stepper
 */

class AuthApiClient {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final DatabaseApiClient _dbApiClient = getIt<DatabaseApiClient>();

  /*
      *For Google sign in there are some exception situation,
      *In this auth, KipssUser can sign in also sign up
      ? We controll the is the new user if it is new user there are not any data in firestore 
      ? So if new user we save to the user in firestore
      ! If not new user we controll the phonenumber because if user didnt complete the @StepperPage user phone didnt save in firestore also
      * If phone number null this meaning KipssUser only click the google sign in not phone verificated neither stepperpage
       */
  Future<KipssUser?> socialLogin({required bool isGoogle}) async {
    // Obtain the auth details from the request

    OAuthCredential? credential;

    credential = await (isGoogle ? _googleSign() : _appleSign());

    if (credential == null) {
      return null;
    }

    // Once signed in, return the UserCredential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    //* If user is new user we save the user in firestore
    try {
      if (userCredential.additionalUserInfo!.isNewUser) {
        final willSaveUser = KipssUser(
            email: userCredential.user!.email,
            userId: userCredential.user!.uid);
        final isSaved = await _dbApiClient.coreSaveUser(willSaveUser);
        //* If successfull return the user
        if (isSaved) {
          return willSaveUser;
        }
        //! If unsuccessfull return null.
        else {
          return null;
        }
      } else {
        final loggedUser =
            await _dbApiClient.coreGetUser(userCredential.user!.uid);

        return loggedUser ??
            KipssUser(
                email: userCredential.user!.email,
                userId: userCredential.user!.uid);
      }
    } catch (e) {
      return null;
    }
  }

  Future<OAuthCredential?> _appleSign() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    return OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
  }

  Future<OAuthCredential?> _googleSign() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return null;
    }

    final googleAuth = await googleUser.authentication;
    // Create a new credential
    return GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
