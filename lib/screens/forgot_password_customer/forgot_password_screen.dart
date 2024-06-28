import 'package:bulty_farmm/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:bulty_farmm/screens/forgot_password_customer/components/forgot_pass_form.dart';
import 'package:bulty_farmm/features/authentication/views/signup/signup_view.dart';
import 'package:get/get.dart';

import '../../repositories/authentication_repository.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 16),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please enter your email and we will send \nyou a link to return to your account",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                ForgotPassForm(),
                SizedBox(height: 16), // Adding some space between the form and button
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.signUp);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
