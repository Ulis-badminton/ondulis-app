import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ondulis_app/components/molecules/thread_card.dart';


@widgetbook.UseCase(
  name: 'ThreadCard',
  type: ThreadCard,
)
ThreadCard threadCard(BuildContext context) {
  return ThreadCard(
    title: 'タイトル',
    icon: Icons.star,
    onPress: () {
      print('タップされました');
    },
  );
}
