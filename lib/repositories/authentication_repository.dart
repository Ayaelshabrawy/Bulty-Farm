/* 
  

  AUthentication Repository'


*/

import 'dart:async';
import 'dart:developer' as dev;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../config/rx_types.dart';

class AUthenticationRepository extends GetxController {
  static AUthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  @override
  onReady() {
    firebaseUser = Rx(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    _setInitialScreen(_auth.currentUser);

    super.onReady();
  }

  /// [_setInitialScreen] --
  _setInitialScreen(User? user) {
    Timer(const Duration(seconds: 3), () {
      // if user is not not
      // go to home
      if (user != null) {
        // Get.offAndToNamed(Route.home);
      } else {
        // here user is not
        // Get.offAndToNamed(Route.login);
      }
    });
  }

  /// [loginWithEmailAndPassword] -- login with email and passeword
  Future<bool> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((_) {
        if (_.user != null) {
          return true;
        }
        return false;
      });
    }on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // Handle user not found error
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          // Handle wrong password error
          print('Wrong password provided for that user.');
        } else {
          // Handle other Firebase Auth exceptions
          print('Error: ${e.message}');
        }
        return Future.error(e.toString());
      } catch (e) {
      dev.log(e.toString());
      return Future.error(e.toString());
    }
  }

  /// [createAnewFirebaseUserWithEmailAndPassword] -- General will create a new firebase user with email and passeword
  Future<bool> createAnewFirebaseUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((_) {
        if (_.user != null) {
          return true;
        }
        return false;
      });
    } catch (e) {
      dev.log(e.toString());
      return Future.error(e.toString());
    }
  }
}
