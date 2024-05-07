import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ondulis_app/components/organisms/header/appbar_with_icon.dart';
import 'package:ondulis_app/components/pages/profile/prpfile_change_page.dart';
import 'package:ondulis_app/repository/user_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final user = ref.watch(userProvider).value;

    debugPrint('user: $user.displayName');

    return Scaffold(
      appBar: AppBarWithIcon(
        title: 'ホーム',
        imagePath: user?.profileImageURL ?? '',
        onIconPressed: () {
          // ProfilePageに遷移する
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProfileChangePage(),
            ),
          );
        },
      ),
      // ログインしているユーザーの情報を表示する
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ログインしています'),
            const Gap(16),
            Text('ユーザー名: ${user?.displayName ?? ''}'),
          ],
        ),
      ),
    );
  }
}
