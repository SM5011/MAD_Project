import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade700, Colors.purple.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // App Name and Button
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Money Tracker",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () =>
                    Get.to(LoginPage(), transition: Transition.fadeIn),
                child: Text("Let’s Start", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
