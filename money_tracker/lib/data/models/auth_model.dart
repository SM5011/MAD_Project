// lib/models/auth_model.dart
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  final String uid;
  final String email;
  final String? displayName; // Optional display name

  AuthModel({required this.uid, required this.email, this.displayName});

  // Factory method to create an AuthModel from a Firebase User object
  factory AuthModel.fromFirebaseUser(User user) {
    return AuthModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
    );
  }
}
