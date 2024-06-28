import 'package:bulty_farmm/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bulty_farmm/Owner/Home/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../controllers/signup_controller.dart';

class SignUpView extends GetView<SignUpController> {
  static String routeName = "/signUp";
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: Get.height,
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80),
              Column(
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
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'TT Firs Neue',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: const Text(
                      "Create new account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'TT Firs Neue',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Signup Body
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Form(
                  key: controller.formKey,
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
                                  27,
                                  139,
                                  225,
                                  0.30196078431372547,
                                ),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(),
                                child: SlideInLeft(
                                  duration: const Duration(milliseconds: 500),
                                  child: TextFormField(
                                    controller: controller.nameController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      labelText: 'User',
                                      labelStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                      prefixIcon: Icon(Icons.person),
                                      border: const UnderlineInputBorder(),
                                    ),
                                    // onSaved: (value){
                                    //   username = value ;
                                    // },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a username';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              SlideInLeft(
                                duration: const Duration(milliseconds: 500),
                                child: Row(
                                  children: [
                                    CountryCodePicker(
                                      onChanged: (CountryCode countryCode) {
                                        print(
                                            "New Country selected: $countryCode");
                                      },
                                      initialSelection: 'EG',
                                      favorite: const ['+20', 'EG'],
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: false,
                                      alignLeft: false,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.mobileController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: 'Mobile Number',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          border: UnderlineInputBorder(),
                                        ),
                                        // onSaved: (value){
                                        //   mobile = value ;
                                        // },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a mobile number';
                                          } else if (!RegExp(r'^[0-9]{10}$')
                                              .hasMatch(value)) {
                                            return 'Please enter a valid 10-digit mobile number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              SlideInLeft(
                                duration: const Duration(milliseconds: 500),
                                child: TextFormField(
                                  controller: controller.emailController,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    prefixIcon: Icon(Icons.email),
                                    border: UnderlineInputBorder(),
                                  ),
                                  // onSaved: (value){
                                  //   email = value ;
                                  // },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an email address';
                                    } else if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              SlideInLeft(
                                duration: const Duration(milliseconds: 500),
                                child: Obx(
                                  () => TextFormField(
                                    controller: controller.passwordController,
                                    keyboardType: TextInputType.text,
                                    obscureText:
                                        !controller.isPasswordVisible.value,
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
                                          color:
                                              controller.isPasswordVisible.value
                                                  ? Colors.blue
                                                  : Colors.grey,
                                        ),
                                        onPressed:
                                            controller.togglePasswordVisibility,
                                      ),
                                    ),
                                    // onSaved: (value){
                                    // password = value ;
                                    // },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a password';
                                      } else if (value.length < 6) {
                                        return 'Password must be at least 6 characters long';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),

                              // Sign up button

                              const SizedBox(height: 30),
                              SlideInLeft(
                                duration: const Duration(milliseconds: 500),
                                child: ElevatedButton(
                                  onPressed: controller.signUp,
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: const Color(0xff0e1f37),
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    width: MediaQuery.of(context).size.width,
                                    child: Obx(
                                      ()=> controller.isCalled.isTrue
                                          ? const SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircularProgressIndicator
                                                  .adaptive(
                                                backgroundColor: Colors.white,
                                              ),
                                            )
                                          : const Text(
                                              'SIGN UP',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
