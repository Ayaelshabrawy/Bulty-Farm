import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bulty_farmm/Home_customer/home/home_screen.dart';
import 'package:bulty_farmm/Customer/signupascustomer.dart';
import 'package:bulty_farmm/forgetpassword/components/forgetpassword.dart';

class LoginascustomerPage extends StatefulWidget {
  const LoginascustomerPage({Key? key}) : super(key: key);

  @override
  _LoginascustomerPageState createState() => _LoginascustomerPageState();
}

class _LoginascustomerPageState extends State<LoginascustomerPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Async login function using Firebase Authentication
  Future<void> _login(BuildContext context) async {
    String emailAddress = _usernameController.text.trim();
    String password = _passwordController.text;

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user != null) {
        // Login successful, navigate to home screen or another destination
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // Handle unexpected login state
        print('Unexpected login state. User is null.');
      }
    } on FirebaseAuthException catch (e) {
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
    } catch (e) {
      // Handle other exceptions
      print('Error: $e');
    }
  }

  void _goToSignupPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupascustomerPage()),
    );
  }

  void _goToForgetPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
    );
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
                                    child: TextField(
                                      controller: _usernameController,
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
                                ),
                                const SizedBox(height: 20),
                                SlideInLeft(
                                  duration: const Duration(milliseconds: 500),
                                  child: TextField(
                                    controller: _passwordController,
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
                                  ),
                                ),
                              ],
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
                            onPressed: () => _login(context),
                            height: 50,
                            color: const Color(0xff2ca6a0),
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
                                  color: const Color(0xff91e061),
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
