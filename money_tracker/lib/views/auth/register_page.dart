import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade700, Colors.purple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // App Icon
                    // Icon(Icons.person_add, size: 80, color: Colors.purple),

                    // SizedBox(height: 10),

                    // Title
                    Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),

                    SizedBox(height: 20),

                    // First Name
                    TextField(
                      controller: authController.firstNameController,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        prefixIcon: Icon(Icons.person, color: Colors.purple),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),

                    SizedBox(height: 15),

                    // Last Name
                    TextField(
                      controller: authController.lastNameController,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        prefixIcon:
                            Icon(Icons.person_outline, color: Colors.purple),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),

                    SizedBox(height: 15),

                    // Email
                    TextField(
                      controller: authController.emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email, color: Colors.purple),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),

                    SizedBox(height: 15),

                    // Password
                    TextField(
                      controller: authController.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock, color: Colors.purple),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),

                    SizedBox(height: 15),

                    // Re-type Password
                    TextField(
                      controller: authController.retypePasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Re-type Password",
                        prefixIcon:
                            Icon(Icons.lock_outline, color: Colors.purple),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Register Button
                    ElevatedButton(
                      onPressed: authController.register,
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        backgroundColor: Colors.purple.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text("Sign Up",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),

                    SizedBox(height: 10),

                    // Back to Login Button
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text("Back to Login",
                          style: TextStyle(color: Colors.purple, fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
