import 'package:flutter/material.dart';
import 'package:ondulis_app/components/atoms/button/svg_button.dart';

class MoodSelector extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgButton(
          svgAssetPath: 'assets/images/bad_mood.svg',
          onPressed: onBadMoodPressed,
        ),
        const SizedBox(width: 16.0),
        SvgButton(
          svgAssetPath: 'assets/images/normal_mood.svg',
          onPressed: onNormalMoodPressed,
        ),
        const SizedBox(width: 16.0),
        SvgButton(
          svgAssetPath: 'assets/images/good_mood.svg',
          onPressed: onGoodMoodPressed,
        ),
      ],
    );
  }
}