import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (user != null) {
        debugPrint('ログインしました ${user.email} , ${user.uid}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (user != null) {
        debugPrint('アカウントを作成しました ${user.email} , ${user.uid}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> sendPasswordResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      debugPrint('パスワード再発行メールを送信しました');
    } catch (e) {
      debugPrint('$e');
    }
  }
}