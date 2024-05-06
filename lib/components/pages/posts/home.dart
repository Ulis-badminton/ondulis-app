// profile_setup_page.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ondulis_app/components/organisms/footer/footer_with_buttons.dart';
import 'package:ondulis_app/components/organisms/header/appbar_with_icon.dart';
import 'package:ondulis_app/components/pages/profile/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarWithIcon(
        title: 'ルームを選択',
        imagePath: 'assets/images/icon.jpg',
        onIconPressed: () {
          debugPrint('press icon button');
          // このあとここにプロフィール編集の画面への遷移処理を追加
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const ProfileSetupPage();
              },
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(16.0),
            FooterWithButtons(
              leftButtonText: const Text('ルームを作成'),
              leftButtonOnPress: () {
                debugPrint('ルームを作成');
                // このあとここにルーム作成のページへの遷移を追加
              },
              rightButtonText: const Text('ルームに参加'),
              rightButtonOnPress: () {
                debugPrint('ルームに参加');
                // このあとここにルーム参加のページへの遷移を追加
              },
            ),
          ],
        ),
      ),
    );
  }
}