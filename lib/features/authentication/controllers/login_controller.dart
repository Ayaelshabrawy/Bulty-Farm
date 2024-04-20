import 'package:bulty_farmm/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../enums.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  Rx<UserRole> loginRole = Rx(UserRole.customer);

  final _authRepo = AUthenticationRepository.instance;

  // Text editing controllers
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // variables
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void login() async {
    if (_formKey.currentState?.validate() ?? false) {
      // call our function to deal with the login
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
        return false;
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
