import 'package:bulty_farmm/config/rx_types.dart';
import 'package:bulty_farmm/enums.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/logger.dart';

class LocalDatabaseService extends GetxService {
  static LocalDatabaseService get to => Get.find();

  // shared preferences
  late SharedPreferences _sharedPreferences;

  // vars
  final _role = 'role';

  @override
  void onReady() {
    Logger.debugPrint('onReady:LocalDatabaseService');
    getUserRole();

    super.onReady();
  }

  @override
  void onInit() {
    Logger.debugPrint('onInit:LocalDatabaseService');
    super.onInit();
  }

  /// [init] -- Initialize Shared Preferences
  Future<LocalDatabaseService> init() async {
    Logger.debugPrint('Initialize Shared Preferences');
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  /// [setUserRole] -- Save the user role to local storage after login
  Future<void> setUserRole(String role) async {
    try {
      await _sharedPreferences.setString(_role, role);
    } catch (e) {
      Logger.debugPrintError('Failed:setUserRole\n$e');
    }
  }

  /// [getUserRole] -- Read user role from local storage when app opened
  void getUserRole() {
    try {
      final _ = _sharedPreferences.getString(_role);

      Logger.debugPrint('$_');

      if (_ == 'customer') {
        roleOfUser.value = UserRole.customer;
      } else if (_ == 'owner') {
        roleOfUser.value = UserRole.owner;
      }
    } catch (e) {
      Logger.debugPrintError('Failed:setUserRole\n$e');
    }
  }
}
