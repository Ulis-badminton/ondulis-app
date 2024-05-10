import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ondulis_app/components/molecules/selector/mood_selector.dart';
import 'package:ondulis_app/components/molecules/textform/customTextFormField.dart';
import 'package:ondulis_app/components/organisms/header/appbar_with_icon.dart';
import 'package:ondulis_app/components/pages/profile/prpfile_change_page.dart';
import 'package:ondulis_app/components/pages/timeLine/time_line_page.dart';
import 'package:ondulis_app/repository/mood_provider.dart';
import 'package:ondulis_app/repository/mood_service.dart';
import 'package:ondulis_app/repository/user_provider.dart';

final isMoodRegisteredTodayProvider = StateNotifierProvider<IsMoodRegisteredTodayNotifier, bool>((ref) {
  return IsMoodRegisteredTodayNotifier();
});

class IsMoodRegisteredTodayNotifier extends StateNotifier<bool> {
  IsMoodRegisteredTodayNotifier() : super(false);

  Future<void> checkIsMoodRegisteredToday(String authId) async {
    state = await MoodService().isMoodRegisteredToday();
  }
}

final moodCommentProvider = StateProvider<String>((ref) => ref.watch(moodProvider).value?.comment ?? '');


class HomePage extends ConsumerWidget {

  HomePage({Key? key});

  final currentUser = MoodService().auth.currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isMoodRegistered = ref.watch(isMoodRegisteredTodayProvider);
    ref.read(isMoodRegisteredTodayProvider.notifier).checkIsMoodRegisteredToday(currentUser!.uid);

    final initMoodComment = ref.watch(moodCommentProvider);

    final user = ref.watch(userProvider).value;
    final userComment = TextEditingController(text: initMoodComment);

    return Scaffold(
      appBar: AppBarWithIcon(
        title: 'ホーム',
        // imagePath: user?.profileImageURL ?? '',
        onIconPressed: () {
          // ProfilePageに遷移する
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProfileChangePage(),
            ),
          );
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('今日の気分は？'),
            const Gap(20),
            MoodSelector(
              onBadMoodPressed: () {
                MoodService().addMood(0, MoodService().convertDateTimeToInt(DateTime.now()));
                ref.read(isMoodRegisteredTodayProvider.notifier)
                  .checkIsMoodRegisteredToday(currentUser!.uid);
                ref.read(isSelectedMoodProvider.notifier).state = 0;
              },
              onNormalMoodPressed: () {
                MoodService().addMood(1, MoodService().convertDateTimeToInt(DateTime.now()));
                ref.read(isMoodRegisteredTodayProvider.notifier)
                  .checkIsMoodRegisteredToday(currentUser!.uid);
                ref.read(isSelectedMoodProvider.notifier).state = 1;
              },
              onGoodMoodPressed: () {
                MoodService().addMood(2, MoodService().convertDateTimeToInt(DateTime.now()));
                ref.read(isMoodRegisteredTodayProvider.notifier)
                  .checkIsMoodRegisteredToday(currentUser!.uid);
                ref.read(isSelectedMoodProvider.notifier).state = 2;
              },
            ),
            const Gap(20),
            CustomTextFormField(
              labelText: 'コメント',
              controller: userComment,
            ),
            const Gap(20),
            Visibility(
              visible: isMoodRegistered,
              child: ElevatedButton(
                onPressed: () {
                  MoodService().addMoodComment(userComment.text);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TimeLinePage(),
                    ),
                  );
                },
                child: const Text('タイムラインへ'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
