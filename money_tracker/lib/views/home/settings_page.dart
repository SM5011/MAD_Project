import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';
import '../../controllers/auth_controller.dart';

class SettingsPage extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(
        children: [
          ListTile(
            title: Text("Dark Mode"),
            trailing: Obx(() => Switch(
                  value: themeController.isDarkMode,
                  onChanged: (val) => themeController.toggleTheme(),
                )),
          ),
          ListTile(
            title: Text("FAQ"),
            onTap: () => Get.snackbar("FAQ", "This is a money tracker app."),
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.logout, color: Colors.red),
            onTap: () => authController.logout(),
          ),
        ],
      ),
    );
  }
}
