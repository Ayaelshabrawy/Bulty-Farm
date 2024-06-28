
import 'package:get/get.dart';

import '../controllers/authentication._controller.dart';
import '../controllers/verification_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/signup_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthenticationController(),
      fenix: true,
    );
    Get.lazyPut(
      () => VerificationController(),
      fenix: true,
    );
    Get.lazyPut(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SignUpController(),
      fenix: true,
    );
  }
}
