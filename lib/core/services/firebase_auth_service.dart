import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_store/core/errors/exceptions.dart';

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
}
