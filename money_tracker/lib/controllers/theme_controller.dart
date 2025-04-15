import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  @override
  void onInit() {
    super.onInit();
    _isDarkMode.value = _box.read('darkMode') ?? false;
  }

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _box.write('darkMode', _isDarkMode.value);
  }
}
