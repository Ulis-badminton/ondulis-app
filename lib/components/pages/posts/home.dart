import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ondulis_app/components/organisms/header/custom_appbar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const Scaffold(
      appBar: CustomAppBar(
        title: 'ホーム',
      ),
      // ログインしているユーザーの情報を表示する
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ログインしています'),
          ],
        ),
      ),
    );
  }
}