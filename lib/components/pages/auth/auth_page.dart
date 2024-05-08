import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ondulis_app/components/molecules/textform/customTextFormField.dart';
import 'package:ondulis_app/components/organisms/header/custom_appbar.dart';
import 'package:ondulis_app/components/pages/home.dart';
import 'package:ondulis_app/components/pages/profile/profile_page.dart';
import 'package:ondulis_app/components/pages/timeLine/time_line_page.dart';
import 'package:ondulis_app/repository/auth_service.dart';
import 'package:ondulis_app/repository/mood_service.dart';


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
                      if (MoodService().isMoodRegisteredToday() == false){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const TimeLinePage()),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: const Text('ユーザーが見つかりません'),
                            content: const Text('新規登録してください'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                                  );
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                      } else if (e.code == 'wrong-password') {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: const Text('パスワードが違います'),
                            content: const Text('再度入力してください'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                      }
                    }
                  }
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
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: const Text('メールアドレスが使われています'),
                            content: const Text('新しいメールアドレスを入力してください'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                      }
                    }
                  }
                },
                child: const Text('新規登録'),
              ),
              const Gap(16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await AuthService().resetPassword(newUserEmail.text);
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: const Text('パスワードリセット'),
                          content: const Text('メールを送信しました'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
                    } catch (e) {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: const Text('エラー'),
                          content: const Text('メールアドレスを確認してください'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
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