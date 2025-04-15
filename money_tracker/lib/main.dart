import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:money_tracker/controllers/auth_controller.dart';
import 'package:money_tracker/controllers/budget_controller.dart';
import 'package:money_tracker/controllers/theme_controller.dart';
import 'package:money_tracker/controllers/transaction_controller.dart';
import 'package:money_tracker/theme.dart';
import 'package:money_tracker/views/auth/start_page.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase
    await Firebase.initializeApp();
    await GetStorage.init();

    // Initialize Controllers
    Get.put(AuthController());
    Get.put(TransactionController());
    Get.put(BudgetController());
    Get.put(ThemeController());

    runApp(MyApp());
  } catch (e) {
    print('Initialization error: $e');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Tracker',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Get.find<ThemeController>().isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      home: StartPage(),
    );
  }
}
