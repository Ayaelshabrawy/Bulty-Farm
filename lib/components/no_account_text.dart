import 'package:bulty_farmm/config/routes.dart';
import 'package:flutter/material.dart';




class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, AppRoutes.signUp),
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 16, color: Color(0xff76984b)),
          ),
        ),
      ],
    );
  }
}
