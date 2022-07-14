import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';

class SettingsController extends BaseController {
  final count = 0.obs;

  final _isDarkTheme = false.obs;
  bool get isDarkTheme => _isDarkTheme.value;
  setDarkTheme(){
    Get.changeTheme(
        !isDarkTheme ?
        ThemeData.light() :
        ThemeData.dark()
    );
  }

  void increment() => count.value++;
}
