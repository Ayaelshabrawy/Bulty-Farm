import 'package:bulty_farmm/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';

class UsertypePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.white;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    // Start paint from 20% height to the left
    ovalPath.moveTo(0, height * 0.2);

    // paint a curve from current position to middle of the screen
    ovalPath.quadraticBezierTo(
        width * 0.40, height * 0.2, width * 0.51, height * 0.5);

    // Paint a curve from current position to bottom left of screen at width * 0.1
    ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);

    // draw remaining line to bottom left side
    ovalPath.lineTo(0, height);

    // Close line to reset it back
    ovalPath.close();


    paint.shader = const LinearGradient(
        colors: [
          Color(0xff0d1f36),
          Color(0xff71d665),
          Color(0xff32725a),



        ],
    ).createShader(Rect.fromLTWH(0, 0, width, height));

    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class Usertype extends StatefulWidget {

  const Usertype({super.key});

  @override
  _UsertypeState createState() => _UsertypeState();
}

class _UsertypeState extends State<Usertype> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Stack(
        children: [
          CustomPaint(
            painter: UsertypePainter(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                          'assets/images/img_8.png', width: 50, height: 50),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '',
                    style: TextStyle(fontSize: 24,
                        color: Color(0xff1e4144),
                        fontFamily: 'TT Firs Neue'),
                  ),
                  const SizedBox(height: 30),
                  FadeInDown(
                    duration: const Duration(milliseconds: 1000),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0d1f36),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            fontFamily: 'TT Firs Neue', color: Color(
                            0xff3cb49f)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.signUp);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0d1f36),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          fontFamily: 'TT Firs Neue', color: Color(0xff3cb49f)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }}