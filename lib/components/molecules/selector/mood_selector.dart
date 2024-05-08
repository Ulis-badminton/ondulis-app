import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ondulis_app/components/atoms/button/svg_button.dart';
import 'package:ondulis_app/repository/mood_provider.dart';

final isSelectedMoodProvider = StateProvider<int?>((ref) => ref.watch(moodProvider).value?.mood);

class MoodSelector extends ConsumerWidget {

  final VoidCallback onBadMoodPressed;
  final VoidCallback onNormalMoodPressed;
  final VoidCallback onGoodMoodPressed;

  const MoodSelector({
    super.key,
    required this.onBadMoodPressed,
    required this.onNormalMoodPressed,
    required this.onGoodMoodPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isSelectedMood = ref.watch(isSelectedMoodProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgButton(
          svgAssetPath: 'assets/images/bad_mood.svg',
          onPressed: onBadMoodPressed,
          isSelected: isSelectedMood == 0,
        ),
        const SizedBox(width: 16.0),
        SvgButton(
          svgAssetPath: 'assets/images/normal_mood.svg',
          onPressed: onNormalMoodPressed,
          isSelected: isSelectedMood == 1,
        ),
        const SizedBox(width: 16.0),
        SvgButton(
          svgAssetPath: 'assets/images/good_mood.svg',
          onPressed: onGoodMoodPressed,
          isSelected: isSelectedMood == 2,
        ),
      ],
    );
  }
}