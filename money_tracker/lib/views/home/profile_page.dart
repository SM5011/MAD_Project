import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
                SizedBox(height: 10),
                Text(
                    authController.firstNameController.text +
                        " " +
                        authController.lastNameController.text,
                    style: TextStyle(fontSize: 20)),
                Text(authController.emailController.text),
                Divider(),
                TextButton(
                  onPressed: () =>
                      Get.snackbar("Password Change", "Feature coming soon!"),
                  child: Text("Change Password?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
