import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ondulis_app/components/molecules/container/thread_card.dart';
import 'package:ondulis_app/components/organisms/header/appbar_with_icon.dart';
import 'package:ondulis_app/components/pages/home.dart';
import 'package:ondulis_app/components/pages/profile/prpfile_change_page.dart';
import 'package:ondulis_app/repository/mood_provider.dart';
import 'package:ondulis_app/repository/user_provider.dart';

class TimeLinePage extends ConsumerWidget {
  const TimeLinePage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).value;
    final todayMoods = ref.watch(todayMoodsProvider).value;

    debugPrint('todayMoodsですよ: $todayMoods');
    debugPrint('user: ${user?.displayName}');

    return Scaffold(
      appBar: AppBarWithIcon(
        title: 'タイムライン',
        imagePath: user?.profileImageURL ?? '',
        onIconPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProfileChangePage(),
            ),
          );
        },
        onBackPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
      ),
      body: todayMoods == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: todayMoods.length,
              itemBuilder: (context, index) {
                final mood = todayMoods[index];
                return ThreadCard(
                  authId: mood.auth_id,
                  mood: mood.mood,
                  comment: mood.comment ?? '',
                );
              },
            ),
    );
  }
}