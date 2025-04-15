import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/controllers/auth_controller.dart';
import 'package:money_tracker/views/home/home_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
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
                    // App Logo
                    Icon(Icons.account_balance_wallet,
                        size: 80, color: Colors.purple),

                    SizedBox(height: 10),

                    // App Title
                    Text(
                      "Money Tracker",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),

                    SizedBox(height: 20),

                    // Email Field
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

                    // Password Field
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

                    SizedBox(height: 20),

                    // Login Button
                    ElevatedButton(
                      onPressed: authController.login,
                      // onPressed: () =>
                      //     Get.to(HomePage(), transition: Transition.fadeIn),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        backgroundColor: Colors.purple.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text("Login",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),

                    SizedBox(height: 10),

                    // Register Button
                    TextButton(
                      onPressed: () =>
                          Get.to(RegisterPage(), transition: Transition.fadeIn),
                      child: Text("Create Account",
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
