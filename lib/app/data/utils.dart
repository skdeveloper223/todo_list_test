import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

/// <<< To get commons function --------- >>>
class Utils {
  static bool isLandScapeMode(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLargeScreen(BuildContext context) {
    return getWidth(context) > 1200;
  }

  static bool isSmallScreen(BuildContext context) {
    return getWidth(context) < 500;
  }

  static bool isMediumScreen(BuildContext context) {
    return getWidth(context) > 800 && getWidth(context) < 1200;
  }

  static bool isTabletScreen(BuildContext context) {
    return getWidth(context) > 300 && getWidth(context) < 820;
  }

  static bool isTabletScreen1(BuildContext context) {
    return getWidth(context) > 300 && getWidth(context) < 800;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// <<< To choose screens portrait --------- >>>
  static void screenPortrait(context) {
    Utils.isSmallScreen(context)
        ? SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ])
        : SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
  }

  /// <<< To choose screens portrait --------- >>>
  static void screenAllow() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  /// <<< To get device type --------- >>>
  String getDeviceType() {
    if (Platform.isAndroid) {
      return 'Android';
    } else {
      return 'iOS';
    }
  }

  /// <<< To check email valid or not --------- >>>
  bool emailValidator(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(email)) {
      return true;
    }
    return false;
  }

  /// <<< To check phone valid or not --------- >>>
  bool phoneValidator(String contact) {
    String p = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(contact)) {
      return true;
    }
    return false;
  }

  /// <<< To check password valid or not --------- >>>
  bool passwordValidator(String contact) {
    String p = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(contact)) {
      return true;
    }
    return false;
  }

  /// <<< To check data, string, list, object are empty or not --------- >>>
  bool isValidationEmpty(String? val) {
    if (val == null || val.isEmpty || val == "null" || val == "" || val == "Null" || val == "NULL") {
      return true;
    } else {
      return false;
    }
  }

  /// <<< To show toast massage  --------- >>>
  void showToast({required String message, required BuildContext context}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.white,
      backgroundColor: Colors.black,
    );
  }

  /// <<< hide keyboard --------- >>>
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// <<<--- Date Picker ----------------->>
  Future<DateTime> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime(DateTime.now().year - 13);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1947, 8),
      lastDate: DateTime(
        DateTime.now().year - 13,
      ),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      return picked;
    }
    return selectedDate;
  }

  /// <<< To read Time stamp --------- >>>
  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('dd-yyyy,MM HH:mm a');
    var date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else {
      if (diff.inDays == 1) {
        time = '${diff.inDays}DAY AGO';
      } else {
        time = '${diff.inDays}DAYS AGO';
      }
    }

    return time;
  }
}

/// <<< Error Massage Red color --------- >>>
void printError(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[91m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// <<< Ok Status Massage Green Color --------- >>>
void printOkStatus(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[92m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// <<< Warning Massage Yellow Color --------- >>>
void printWarning(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[93m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// <<< Action Massage Blue Color --------- >>>
void printAction(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[94m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// <<< Cancel Massage Gray Color --------- >>>
void printCancel(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[96m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// <<< Error Massage Red color --------- >>>
void printWhite(String text) {
  if (Platform.isAndroid) {
    debugPrint('\x1B[97m$text\x1B[0m');
  } else {
    debugPrint(text);
  }
}

/// Color Print Code --------------->>>>
/**
    debugPrint("\x1B[1m 1hello \x1B[0m");
    debugPrint("\x1B[3m 3hello \x1B[0m");
    debugPrint("\x1B[4m 4hello \x1B[0m");
    debugPrint("\x1B[7m 7hello \x1B[0m");
    debugPrint("\x1B[9m 9hello \x1B[0m");
    debugPrint("\x1B[21m 21hello \x1B[0m");
    debugPrint("\x1B[30m 30hello \x1B[0m");
    debugPrint("\x1B[31m 31hello \x1B[0m");
    debugPrint("\x1B[32m 32hello \x1B[0m");
    debugPrint("\x1B[33m 33hello \x1B[0m");
    debugPrint("\x1B[34m 34hello \x1B[0m");
    debugPrint("\x1B[35m 35hello \x1B[0m");
    debugPrint("\x1B[36m 36hello \x1B[0m");
    debugPrint("\x1B[37m 37hello \x1B[0m");
    debugPrint("\x1B[40m 40hello \x1B[0m");
    debugPrint("\x1B[41m 41hello \x1B[0m");
    debugPrint("\x1B[42m 42hello \x1B[0m");
    debugPrint("\x1B[43m 43hello \x1B[0m");
    debugPrint("\x1B[44m 44hello \x1B[0m");
    debugPrint("\x1B[45m 45hello \x1B[0m");
    debugPrint("\x1B[46m 46hello \x1B[0m");
    debugPrint("\x1B[47m 47hello \x1B[0m");
    debugPrint("\x1B[51m 51hello \x1B[0m");
    debugPrint("\x1B[52m 52hello \x1B[0m");
    debugPrint("\x1B[90m 90hello \x1B[0m");
    debugPrint("\x1B[91m 91hello \x1B[0m");
    debugPrint("\x1B[92m 92hello \x1B[0m");
    debugPrint("\x1B[93m 93hello \x1B[0m");
    debugPrint("\x1B[94m 94hello \x1B[0m");
    debugPrint("\x1B[95m 95hello \x1B[0m");
    debugPrint("\x1B[96m 96hello \x1B[0m");
    debugPrint("\x1B[97m 97hello \x1B[0m");
    debugPrint("\x1B[100m 100hello \x1B[0m");
    debugPrint("\x1B[101m 101hello \x1B[0m");
    debugPrint("\x1B[102m 102hello \x1B[0m");
    debugPrint("\x1B[103m 103hello \x1B[0m");
    debugPrint("\x1B[104m 104hello \x1B[0m");
    debugPrint("\x1B[105m 105hello \x1B[0m");
    debugPrint("\x1B[106m 106hello \x1B[0m");
    debugPrint("\x1B[107m 107hello \x1B[0m");
    debugPrint("\x1B[108m 108hello \x1B[0m");
 **/
