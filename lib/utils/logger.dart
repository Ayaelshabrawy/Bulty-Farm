
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

import '../config/static_v.dart';

/// default Logger callback
void appLogWriterCallback(String value, {bool isError = false}) {
  if (isError || Get.isLogEnable) dev.log(value, name: StaticValues.appName);
}

class Logger {
  static LogMode _logMode = LogMode.debug;

  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void log(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      debugPrintError("Error: $data$stackTrace");
    } else {
      debugPrint("$data");
    }
  }

  static void debugPrint(Object message, [bool isWarning = false]) {
    //
    if (kDebugMode) {
      dev.log(
        message.toString(),
        name: StaticValues.appName,
        time: DateTime.now(),
      );
    }
  }

  static void debugPrintError(Object message) {
    if (kDebugMode) {
      dev.log(
        message.toString(),
        name: StaticValues.appName,
        time: DateTime.now(),
        error: true,
      );
    }
  }
}

enum LogMode { debug, live }
