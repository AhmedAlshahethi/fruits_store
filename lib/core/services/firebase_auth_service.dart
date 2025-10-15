import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_store/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Excpetion in FirebaseAuthService - createUserWithEmailAndPassword : ${e.toString()} and code ${e.code}",
      );
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: 'الايميل مستخدم من قبل');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomExceptions(message: 'حدث خطأ ما');
      }
    } catch (e) {
      log(
        "Excpetion in FirebaseAuthService - createUserWithEmailAndPassword : ${e.toString()} ",
      );
      throw CustomExceptions(message: 'حدث خطأ ما');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Excpetion in FirebaseAuthService - signInWithEmailAndPassword : ${e.toString()} and code ${e.code}",
      );
      if (e.code == 'user-not-found') {
        throw CustomExceptions(
          message: 'كلمة المرور غير صحيحة او المستخدم غير موجود',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions(
          message: 'كلمة المرور غير صحيح او المستخدم غير موجود',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomExceptions(message: 'حدث خطأ ما');
      }
    } catch (e) {
      log(
        "Excpetion in FirebaseAuthService - signInWithEmailAndPassword : ${e.toString()} ",
      );
      throw CustomExceptions(message: 'حدث خطأ ما');
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
