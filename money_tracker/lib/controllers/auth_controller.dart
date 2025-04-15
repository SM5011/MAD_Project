import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/home/home_page.dart';
import '../views/auth/login_page.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    retypePasswordController.dispose();
    super.onClose();
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  void login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.snackbar("Success", "Login Successful",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      String message = "An error occurred";
      if (e is FirebaseAuthException) {
        message = e.message ?? message;
      }
      Get.snackbar("Login Failed", message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void register() async {
    if (passwordController.text != retypePasswordController.text) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.snackbar("Success", "Registration Successful",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      String message = "An error occurred";
      if (e is FirebaseAuthException) {
        message = e.message ?? message;
      }
      Get.snackbar("Registration Failed", message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logout() async {
    await _auth.signOut();
  }
}
