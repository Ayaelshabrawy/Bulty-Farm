
import 'package:flutter/material.dart';
import 'package:bulty_farmm/Owner/Home/loginasowner.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bulty_farmm/Owner/Home/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupasownerPage extends StatefulWidget {
  const SignupasownerPage({Key? key}) : super(key: key);

  @override
  _SignupasownerPageState createState() => _SignupasownerPageState();
}

class _SignupasownerPageState extends State<SignupasownerPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fixedIDController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isFixedIDVisible = false;
  var username, mobile, email, password;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  Future<UserCredential?> _SignUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("valid");

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
            builder: (_) => const LoginasownerPage(),
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
                                    decoration: const BoxDecoration(),
                                    child: SlideInLeft(
                                      duration: const Duration(milliseconds: 500),
                                      child: TextFormField(
                                        controller: _nameController,
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
                                            decoration: const InputDecoration(
                                              labelText: 'Mobile Number',
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                              border: UnderlineInputBorder(),
                                            ),
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
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                        prefixIcon: Icon(Icons.email),
                                        border: UnderlineInputBorder(),
                                      ),
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
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  SlideInLeft(
                                    duration: const Duration(milliseconds: 500),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      keyboardType: TextInputType.text,
                                      obscureText: !_isPasswordVisible,
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
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  SlideInLeft(
                                    duration: const Duration(milliseconds: 500),
                                    child: TextFormField(
                                      controller: _fixedIDController,
                                      obscureText: !_isFixedIDVisible,
                                      decoration: InputDecoration(
                                        labelText: 'Unique ID',
                                        labelStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                        prefixIcon: const Icon(Icons.lock),
                                        border: const UnderlineInputBorder(),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isFixedIDVisible ? Icons.visibility : Icons.visibility_off,
                                            color: _isFixedIDVisible ? Colors.blue : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isFixedIDVisible = !_isFixedIDVisible;
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
                                        UserCredential? response = await _SignUp();
                                        if (response != null) {
                                          print(response.user!.email);
                                        }
                                      },
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
                                        child: const Text(
                                          'SIGN UP',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
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
                                          builder: (_) => const LoginasownerPage(),
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
