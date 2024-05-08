import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ondulis_app/components/molecules/selector/mood_selector.dart';

@widgetbook.UseCase(
  name: 'MoodSelector',
  type: MoodSelector
)
MoodSelector moodSelector(BuildContext context) {
  return MoodSelector(
    onBadMoodPressed: () {
      debugPrint('bad mood pressed');
    },
    onNormalMoodPressed: () {
      debugPrint('normal mood pressed');
    },
    onGoodMoodPressed: () {
      debugPrint('good mood pressed');
    },
  );
}
