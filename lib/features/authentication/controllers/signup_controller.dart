import 'package:bulty_farmm/config/rx_types.dart';
import 'package:bulty_farmm/features/authentication/controllers/verification_controller.dart';
import 'package:bulty_farmm/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../enums.dart';
import '../../../repositories/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final _authRepo = AUthenticationRepository.instance;
  final _verController = VerificationController.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fixedIDController = TextEditingController();

  // variables
  final loginRole = UserRole.customer.obs;
  final isPasswordVisible = false.obs;
  final isCalled = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void signUp() async {
    // cancel if called
    if(isCalled.isTrue) return; 
    if (formKey.currentState?.validate() ?? false) {
      isCalled.value = true;
      final uR = await _authRepo
          .createAnewFirebaseUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .onError((error, stackTrace) {
        Get.snackbar(
          'Error',
          '$error',
          backgroundColor: Colors.redAccent,
        );
        isCalled.value = false;
        return false;
      });

      // check if user is allowed to create an owner account
      final c =
          await _verController.checkEmailBeforeRegister(emailController.text);

      // check if user is created
      if (uR && firebaseUser.value != null) {
        final _ = UserModel(
          uid: firebaseUser.value!.uid,
          name: nameController.text,
          email: emailController.text,
          role: c ? UserRole.owner.name : UserRole.customer.name,
          phone: mobileController.text,
        );
        // Verification controller will handle everything
        await _verController.verifyUser(_);
        isCalled.value = false;
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    mobileController.dispose();
    nameController.dispose();

    fixedIDController.dispose();

    super.dispose();
  }
}


// Check if all fields are filled
                                        // if (controller
                                        //         .nameController.text.isEmpty ||
                                        //     controller
                                        //         .mobileController.text.isEmpty ||
                                        //     controller
                                        //         .emailController.text.isEmpty ||
                                        //     controller.passwordController.text
                                        //         .isEmpty ||
                                        //     controller.fixedIDController.text
                                        //         .isEmpty) {
                                        //   // Show an error message if any field is empty
                                        //   showDialog(
                                        //     context: context,
                                        //     builder: (context) => AlertDialog(
                                        //       title: Text('Error'),
                                        //       content: Text(
                                        //           'Please fill in all required fields.'),
                                        //       actions: [
                                        //         TextButton(
                                        //           onPressed: () {
                                        //             Navigator.pop(context);
                                        //           },
                                        //           child: Text('OK'),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   );
                                        // } 