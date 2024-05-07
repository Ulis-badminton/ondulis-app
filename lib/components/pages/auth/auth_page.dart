import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ondulis_app/components/molecules/textform/customTextFormField.dart';
import 'package:ondulis_app/components/organisms/header/custom_appbar.dart';
import 'package:ondulis_app/components/pages/home.dart';
import 'package:ondulis_app/components/pages/profile/profile_page.dart';
import 'package:ondulis_app/repository/auth_service.dart';


class AuthPage extends ConsumerWidget{

  final _formKey = GlobalKey<FormState>();

  AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final newUserEmail = TextEditingController();
    final newUserPassword = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'ログイン',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'メールアドレス',
                controller: newUserEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'メールアドレスを入力してください';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                labelText: 'パスワード',
                controller: newUserPassword,
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await AuthService().signIn(
                        newUserEmail.text,
                        newUserPassword.text,
                      );
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('ユーザーが見つかりませんでした'),
                          ),
                        );
                      } else if (e.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('パスワードが間違っています'),
                          ),
                        );
                      }
                    }
                  }
                  debugPrint('ログインが完了しました');
                  debugPrint('${FirebaseAuth.instance.currentUser?.uid}');
                },
                child: const Text('ログイン'),
              ),
              const Gap(16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await AuthService().createAccount(
                        newUserEmail.text,
                        newUserPassword.text,
                      );
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
                    );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('このメールアドレスはすでに登録されています'),
                          ),
                        );
                      }
                    }
                  }
                  debugPrint('新規登録が完了しました');
                },
                child: const Text('新規登録'),
              ),
              const Gap(16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await AuthService().resetPassword(newUserEmail.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('パスワード再設定用のメールを送信しました'),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('メールアドレスが間違っています'),
                        ),
                      );
                    }
                  }
                },
                child: const Text('パスワードをリセット'),
              ),
            ]
          )
        )
      )
    );
  }
}