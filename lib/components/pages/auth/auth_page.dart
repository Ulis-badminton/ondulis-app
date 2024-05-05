// auth/auth_page.dart
import 'package:flutter/material.dart';
import 'package:ondulis_app/components/pages/profile/profile_page.dart';
import 'package:ondulis_app/auth/auth_service.dart';
import 'package:ondulis_app/components/molecules/customTextFormField.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:gap/gap.dart';

final loggers = SimpleLogger()
  ..setLevel(
    Level.FINEST,
    includeCallerInfo: true,
  );

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: _emailController,
              labelText: 'メールアドレス',
              obscureText: true,
            ),
            const Gap(16.0),
            CustomTextFormField(
              controller: _passwordController,
              labelText: 'パスワード',
              obscureText: true,
            ),
            const Gap(16.0),
            ElevatedButton(
              // auth_service.dartのsignInWithEmailAndPasswordを呼び出す
              // MaterialPageRouteでHomePageに遷移
              onPressed: () {
                AuthService().signInWithEmailAndPassword(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ProfileSetupPage()));
              },
              child: const Text('ログイン'),
            ),
            const Gap(16.0),
            ElevatedButton(
              onPressed: () {
                AuthService().createUserWithEmailAndPassword(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ProfileSetupPage()));
              },
              child: const Text('アカウント作成'),
            ),
            const Gap(16.0),
            ElevatedButton(
              onPressed: () {
                AuthService().sendPasswordResetEmail();
                // ここでメールを送信したことを知らせるSnackBarを表示
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('パスワード再発行メールを送信しました'),
                  ),
                );
              },
              child: const Text('パスワード再発行'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}