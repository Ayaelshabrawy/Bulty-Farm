import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bulty_farmm/Owner/Home/Homepage.dart';
import 'package:animate_do/animate_do.dart'; // Import the correct package for animations

class SignUpSuccessPage extends StatefulWidget {
  const SignUpSuccessPage({super.key});

  @override
  _SignUpSuccessPageState createState() => _SignUpSuccessPageState();
}

class _SignUpSuccessPageState extends State<SignUpSuccessPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'TT Firs Neue', // Specify the font family here
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[ Color(0xff0d1f36),
              Color(0xff3cb49f),
              ]
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Colors.white, // Adjusted to white for better visibility
                ),
                const SizedBox(height: 20),
                FadeInUp(
                  duration: const Duration(milliseconds: 100),
                  child: const Text(
                    'Account Created Successfully!',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'TT Firs Neue',
                      color: Colors.white, // Adjusted to white for better visibility
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
