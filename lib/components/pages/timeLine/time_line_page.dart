import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ondulis_app/components/organisms/header/appbar_with_icon.dart';
import 'package:ondulis_app/components/pages/profile/prpfile_change_page.dart';
import 'package:ondulis_app/repository/mood_provider.dart';
import 'package:ondulis_app/repository/user_provider.dart';

class TimeLinePage extends ConsumerWidget {
  const TimeLinePage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final user = ref.watch(userProvider).value;
    // final authId = ref.watch(userProvider).value?.authId;
    final userMood = ref.watch(moodProvider).value;
    final mood = userMood?.mood ?? 0;
    final comment = userMood?.comment ?? '';

    debugPrint('user: $user.displayName');

    return Scaffold(
      appBar: AppBarWithIcon(
        title: 'タイムライン',
        imagePath: user?.profileImageURL ?? '',
        onIconPressed: () {
          // ProfilePageに遷移する
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProfileChangePage(),
            ),
          );
        },
        onBackPressed: () {
            Navigator.pop(context);
          },
      ),
      // ログインしているユーザーの情報を表示する
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('今日の気分'),
            const Gap(20),
            Text('今日の気分は$moodです'),
            const Gap(20),
            Text('コメント: $comment')
          ],
        ),
      )
    );
  }
}
