import 'package:bulty_farmm/features/authentication/models/user_model.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../../../config/rx_types.dart';
import '../../../repositories/verification_repository.dart';
import '../../../services/local_database_service.dart';
import '../../../utils/global_methods.dart';
import '../../../utils/logger.dart';

class VerificationController extends GetxController {
  static VerificationController get instance => Get.find();

  /// Instances
  final _verificationRepo = VerificationRepository.instance;
  // final _localDB = LocalDatabaseService();

  @override
  void onInit() {
    Logger.debugPrint('Starting Verification Process...');
    super.onInit();
  }

  @override
  void onReady() {
    // _userRole.bindStream(getUserROLE());
    // getUserROLE();

    super.onReady();
  }

  /// [verifyUser] -- Verify the user
  Future<String> verifyUser(UserModel user) async {
    if (firebaseUser.value == null) {
      return '';
    }
    // check user role
    final r = await _verificationRepo.checkUserRole(
      firebaseUser.value!.uid,
      email: firebaseUser.value!.email!,
      userModel: user,
    );
    Logger.debugPrint(r);

    // sign user role
    await _signUserRole(r);
    return r;
  }

  Future<void> _signUserRole(String roleT) async {
    LocalDatabaseService.to.setUserRole(roleT);
    LocalDatabaseService.to.getUserRole();

    // Get.back(closeOverlays: true);
  }

  /// [checkEmailBeforeRegister] -- Check the email before register
  Future<bool> checkEmailBeforeRegister(String email) async {
    // check if is email allowed to be an owner
    return await _verificationRepo.checkIfEmailBelongsToAnOwner(email);
  }
}
