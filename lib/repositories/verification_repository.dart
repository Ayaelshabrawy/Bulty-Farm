import 'package:bulty_farmm/enums.dart';
import 'package:bulty_farmm/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../utils/logger.dart';

class VerificationRepository extends GetxController {
  static VerificationRepository get instance => Get.find();

  /// Instances
  final _db = FirebaseFirestore.instance;

  /* -- User Verification -- */
  /// [_addNewUserModel] -- Add new registered user
  Future<void> _addNewUserModel({
    required UserModel user,
  }) async {
    try {
      await _db.collection('users').doc(user.uid).set(user.toDocument());
    } catch (e) {
      final _ = 'Error\n At _addNewUserModel:failed \n Reason: $e';
      Logger.debugPrintError(_);
      return await Future.error(_);
    }
  }

  /// [_getUserModel] -- Get registered user only After login
  Future<UserModel?> _getUserModel({
    required String uid,
  }) async {
    final _ = 'Getting registered user $uid';

    try {
      final d = await _db.collection('users').doc(uid).get();

      Logger.debugPrint('is exist: ${d.exists}');
      if (d.exists) {
        final r = UserModel.fromDocument(d.data()!);
        Logger.debugPrint('User role:  ${r.role}');
        return r;
      }
      return null;
    } catch (e) {
      final _ = 'Error\n At _getUserModel:failed \n Reason: $e';
      Logger.debugPrintError(_);
      Logger.debugPrint(_);
      return await Future.error(_);
    }
  }

  /// [_isEmailBelongsToOwner] -- return true if it is owner
  Future<bool> _isEmailBelongsToOwner(String email) async {
    try {
      final doc = await _db.collection('config').doc('registeredUsers').get();
      List emails = [];
      emails = doc['ownerEmails'];
      Logger.debugPrint(emails);

      // check if email is in the list
      if (emails.contains(email)) {
        return true;
      }
      return false;
    } catch (e) {
      Logger.debugPrintError(e);
      return Future.error(e);
    }
  }

  /// [checkUserRole] Check User Role
  Future<String> checkUserRole(
    String uid, {
    UserModel? userModel,
    required String email,
  }) async {
    // check the email
    // final eCheck = await _isEmailBelongsToOwner(email);
    // if (eCheck == true) {
    //   Logger.debugPrint("$email is Owner $eCheck");
    //   return UserRole.owner.name;
    // }
    // get the user doc
    final ru = await _getUserModel(uid: uid);
    if (ru == null && userModel != null) {
      // handle new user registeration
      await _addNewUserModel(user: userModel);
      Logger.debugPrint("Register new user with role ${userModel.role}");
      return userModel.role;
    }
    // check if user is not logged in
    if (ru?.role == null) {
      return UserRole.unknown.name;
    }
    // simply return the user role
    return ru?.role ?? UserRole.unknown.name;
  }

  /* -- owner Verification -- */
  /// [checkIfEmailBelongsToAnOwner] -- Checks if email belongs to owner
  Future<bool> checkIfEmailBelongsToAnOwner(String email) async {
    try {
      final doc = await _db.collection('config').doc('registeredUsers').get();

      List eList = doc['ownerEmails'] as List;

      Logger.debugPrint(eList[0].toString());

      return eList.contains(email);
    } catch (e) {
      Logger.debugPrintError(
          'Error\n At checkIfEmailBelongsToAnOwner:failed \n Reason: $e');
      return false;
    }
  }
}
