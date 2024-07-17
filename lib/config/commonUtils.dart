
import 'package:flutter/foundation.dart';



class CommonUtils {
  static bool isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  static void debugLog(String log) {
    if (kDebugMode) {
      debugPrint(log);
    }
  }






}
