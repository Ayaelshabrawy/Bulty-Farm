import 'package:bulty_farmm/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../enums.dart';
import '../../../utils/logger.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  Rx<UserRole> loginRole = Rx(UserRole.customer);

  final _authRepo = AUthenticationRepository.instance;

  // Text editing controllers
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // variables
  final isPasswordVisible = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void login() async {
    Logger.debugPrint('Login called');
    if (formKey.currentState?.validate() ?? false) {
      // call our function to deal with the login
      debugPrint(email.text);
      final u = await _authRepo
          .loginWithEmailAndPassword(
        email: email.text,
        password: password.text,
      )
          .onError((error, stackTrace) {
        Get.snackbar(
          'Error',
          '$error',
          backgroundColor: Colors.redAccent,
        );
      });

      // u if login is sucess
      // prepareUserFirstLoginDocument()
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
