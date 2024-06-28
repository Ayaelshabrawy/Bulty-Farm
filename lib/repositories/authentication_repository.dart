/* 
  

  AUthentication Repository'


*/

import 'dart:async';
import 'dart:developer' as dev;

import 'package:bulty_farmm/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../config/routes.dart';
import '../config/rx_types.dart';

import '../utils/logger.dart';

class AUthenticationRepository extends GetxController {
  static AUthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    Logger.debugPrint('AUthenticationRepository:onInit');
    super.onInit();
  }

  @override
  onReady() {
    firebaseUser = Rx(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // _auth.signOut();
    ever(firebaseUser, _setInitialScreen);
    Logger.debugPrint('${firebaseUser.value?.email}');
    Logger.debugPrint('AUthenticationRepository:onReady');
    super.onReady();
  }

  /// [_setInitialScreen] --
  _setInitialScreen(User? user) {
    Timer(const Duration(seconds: 4), () {
      // if user is not not
      // go to home
      if (user == null) {
        // here user is not
        Logger.debugPrint(' user is not logged in');
        // Get.offAndToNamed(Route.login);
        Get.offAndToNamed(AppRoutes.authScreen);
      } else {
        if(roleOfUser.value == UserRole.customer) {
          // go to onBoarding view
          if(Get.currentRoute != AppRoutes.onboarding) {
            Get.offAndToNamed(AppRoutes.onboarding);
          }
        } else if (roleOfUser.value == UserRole.owner){
          // go to Hoemview ~~ Dashboard
          if(Get.currentRoute != AppRoutes.home) {
            Get.offAndToNamed(AppRoutes.home);
          }
        }
        
      }
    });
  }

  /// [loginWithEmailAndPassword] -- login with email and passeword
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // .then((_) {
      // if (_.user != null) {
      //   return true;
      // }
      // return false;
      // });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Handle user not found error
        Logger.debugPrintError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // Handle wrong password error
        Logger.debugPrintError('Wrong password provided for that user.');
      } else {
        // Handle other Firebase Auth exceptions
        Logger.debugPrintError('Error: ${e.message}');
      }
      // return Future.error(e.toString());
    } catch (e) {
      dev.log(e.toString());
      Logger.debugPrintError(e);
      // return Future.error(e.toString());
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

  ///[]
  /// [signOut] -- General will sign out the current user from the firebase
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Logger.debugPrintError(e);
    }
  }
}
