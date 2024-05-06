import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ondulis_app/components/organisms/header/custom_appbar.dart';
import 'package:ondulis_app/providers/user_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'ホーム',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Center(
        child: userStream.when(
          data: (user) {
            if (user == null) {
              return const Text('ログインしていません');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ディスプレイ名: ${user.displayName}'),
                  Text('メールアドレス: ${user.email}'),
                ],
              );
            }
          },
          error: (error, stackTrace) => Text('エラー: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}