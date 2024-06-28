

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController with GetTickerProviderStateMixin {


  late AnimationController _controller;
  late Animation<double> _animation;

  get animation => _animation;

  get controller => _controller;



  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

    @override
  void onInit() {
    initState();
    super.onInit();
  }
}