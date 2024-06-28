import 'package:bulty_farmm/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bulty_farmm/Owner/Home/Homepage.dart';
import 'package:bulty_farmm/screens/forgot_password_customer/forgot_password_screen.dart';

import 'dart:core';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  void _goToSignupPage(BuildContext context) {
    Get.toNamed(AppRoutes.signUp);
  }

  void _goToForgetPassword(BuildContext context) {
    Get.to(() => const ForgotPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xff0d1f36),
              Color(0xff3cb49f),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.white,
                      ),
                    ),
               
               
                    FadeInDown(
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'TT Firs Neue',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeInDown(
                      duration: const Duration(milliseconds: 1300),
                      child: const Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'TT Firs Neue',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 60),
                        FadeInLeft(
                          duration: const Duration(milliseconds: 1400),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      27, 139, 225, 0.30196078431372547),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ],
                            ),
                            child: Form(
                              key: controller.formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: SlideInLeft(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: TextFormField(
                                        controller: controller.username,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Icon(Icons.email),
                                          border: UnderlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email address';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SlideInLeft(
                                    duration: const Duration(milliseconds: 500),
                                    child: Obx(
                                      () => TextFormField(
                                        controller: controller.password,
                                        obscureText:
                                            controller.isPasswordVisible.value,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: const Icon(Icons.lock),
                                          border: const UnderlineInputBorder(),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              controller.isPasswordVisible.value
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: controller
                                                      .isPasswordVisible.value
                                                  ? Colors.blue
                                                  : Colors.grey,
                                            ),
                                            onPressed: controller
                                                .togglePasswordVisibility,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        FadeInRight(
                          duration: const Duration(milliseconds: 1400),
                          child: TextButton(
                            onPressed: () => _goToForgetPassword(context),
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'TT Firs Neue',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        FadeInRight(
                          duration: const Duration(milliseconds: 1400),
                          child: MaterialButton(
                            onPressed: () {
                              controller.login();
                            },
                            height: 50,
                            color: const Color(0xff0e1f37),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'TT Firs Neue',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () => _goToSignupPage(context),
                                  height: 50,
                                  color: const Color(0xff46d5ad),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Create new account ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'TT Firs Neue',
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
