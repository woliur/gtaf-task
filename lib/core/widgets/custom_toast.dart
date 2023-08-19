import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../route/navigation_service.dart';

void showCustomToast(
    {required String msg, Color? bg, ToastGravity? gravity, Toast? length}) {
  BuildContext? context = NavigationService.navigatorKey.currentContext;
  Fluttertoast.showToast(
    msg: msg,
    toastLength: length ?? Toast.LENGTH_SHORT,
    gravity: gravity ?? ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: bg ?? const Color(0xFF224072),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

