import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ondulis_app/components/molecules/textform/customTextFormField.dart';
import 'package:ondulis_app/components/pages/posts/home.dart';
import 'package:ondulis_app/components/pages/profile/profile_page.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (e.code == '') {
        _showSnackBar('ユーザーが登録されていません');
      } else if (e.code == 'wrong-password') {
        _showSnackBar('パスワードが間違っています');
      } 
    }
  }

  Future<void> _createAccount() async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final user = userCredential.user;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (e.code == 'email-already-in-use') {
        _showSnackBar('このメールアドレスはすでに登録されています');
      }
    }
  }

  Future<void> _resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text);
      _showSnackBar('パスワード再設定用のメールを送信しました');
    } catch (e) {
      debugPrint(e.toString());
      _showSnackBar('メールアドレスが間違っています');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン/新規登録'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'メールアドレス',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'メールアドレスを入力してください';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                labelText: 'パスワード',
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'パスワードを入力してください';
                  }
                  return null;
                },
              ),
              const Gap(16.0),
              ElevatedButton(
                onPressed: _signIn,
                child: const Text('ログイン'),
              ),
              ElevatedButton(
                onPressed: _createAccount,
                child: const Text('アカウント作成'),
              ),
              TextButton(
                onPressed: _resetPassword,
                child: const Text('パスワードを忘れた場合'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}