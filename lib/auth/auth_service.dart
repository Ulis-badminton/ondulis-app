import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ondulis_app/auth/auth_error.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

    Future<FirebaseAuthResultStatus> signInEmail(
      String email, String password) async {
    FirebaseAuthResultStatus result;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      debugPrint('succeed');
      if (userCredential.user! != null) {
        result = FirebaseAuthResultStatus.Successful;
      } else {
        result = FirebaseAuthResultStatus.Undefined;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      result = FirebaseAuthExceptionHandler.handleException(e);
    }
    return result;
  }

  Future<FirebaseAuthResultStatus> createUserEmail(
      String email, String password) async {
    FirebaseAuthResultStatus result;
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      debugPrint('succeed');
      if (userCredential.user! != null) {
        result = FirebaseAuthResultStatus.Successful;
      } else {
        result = FirebaseAuthResultStatus.Undefined;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      result = FirebaseAuthExceptionHandler.handleException(e);
    }
    return result;
  }

  // Future<void> createUserWithEmailAndPassword(BuildContext context) async {
  //   try {
  //     final User? user = (await _auth.createUserWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     ))
  //         .user;
  //     if (user != null) {
  //       debugPrint('アカウントを作成しました ${user.email} , ${user.uid}');
  //     }
  //   } catch (e) {
  //     debugPrint('$e');
  //   }
  // }

  Future<void> sendPasswordResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      debugPrint('パスワード再発行メールを送信しました');
    } catch (e) {
      debugPrint('$e');
    }
  }
}