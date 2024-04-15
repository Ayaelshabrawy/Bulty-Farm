import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animate_do/animate_do.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:bulty_farmm/Customer/loginascustomer.dart';

class SignupascustomerPage extends StatefulWidget {
  static String routeName = "/sign_up";

  const SignupascustomerPage({Key? key}) : super(key: key);

  @override
  _SignupascustomerPageState createState() => _SignupascustomerPageState();
}

class _SignupascustomerPageState extends State<SignupascustomerPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  var username, mobile, email, password;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  Future<UserCredential?> _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form fields

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: email,
            password: password,
        );

        print('User signed up successfully: ${userCredential.user!.uid}');

        // Navigate to the login page after successful sign-up
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginascustomerPage(),
          ),
        );

        return userCredential;
      } catch (e) {
        if (e is FirebaseAuthException) {
          if (e.code == 'weak-password') {
            print('Password is too weak');
            // Show error dialog or handle weak password case
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email');
            // Show error dialog or handle email already in use case
          }
        }
        print('Error signing up: $e');
        // Handle the sign-up error as per your app's requirements
      }
    }
    return null;
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
              Color(0xff2ca6a0),
              Color(0xff91e061),
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
                    child: Form(
                      key: _formKey,
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
                                    color: Color.fromRGBO(27, 139, 225, 0.30196078431372547),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  )
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: SlideInLeft(
                                      duration: const Duration(milliseconds: 500),
                                      child: TextFormField(
                                        controller: _nameController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'User',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Icon(Icons.person),
                                          border: UnderlineInputBorder(),
                                        ),
                                        onSaved: (value){
                                          username = value ;
                                        },
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
                                            print("New Country selected: $countryCode");
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
                                            controller: _mobileController,
                                            keyboardType: TextInputType.number,
                                            onSaved: (value){
                                             mobile = value ;
                                            },
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter a mobile number';
                                              } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                                return 'Please enter a valid 10-digit mobile number';
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              labelText: 'Mobile Number',
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                              border: UnderlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  SlideInLeft(
                                    duration: const Duration(milliseconds: 500),
                                    child: TextFormField(
                                      controller: _emailController,
                                      onSaved: (value){
                                        email = value ;
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter an email address';
                                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                        prefixIcon: Icon(Icons.email),
                                        border: UnderlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  SlideInLeft(
                                    duration: const Duration(milliseconds: 500),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      keyboardType: TextInputType.text,
                                      obscureText: !_isPasswordVisible,
                                      onSaved: (value){
                                       password = value ;
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a password';
                                        } else if (value.length < 6) {
                                          return 'Password must be at least 6 characters long';
                                        }
                                        return null;
                                      },
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
                                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                            color: _isPasswordVisible ? Colors.blue : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isPasswordVisible = !_isPasswordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  SlideInLeft(
                                    duration: const Duration(milliseconds: 500),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        UserCredential? response = await _signUp();
                                        if (response != null) {
                                          print(response.user!.email);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(80.0),
                                        ),
                                        padding: const EdgeInsets.all(0),
                                        backgroundColor: const Color(0xff2ca6a0),
                                        textStyle: TextStyle(color: Colors.white),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50.0,
                                        child: const Text(
                                          'SIGN UP',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'TT Firs Neue',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const LoginascustomerPage(),
                                        ),
                                      );
                                    },
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Already have an account? ',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Login',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
