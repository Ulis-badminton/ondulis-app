import 'package:flutter/material.dart';
import 'package:ondulis_app/components/organisms/widgetList/thread_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ondulis_app/components/molecules/container/thread_card.dart';

List<ThreadCard> threads = [
  ThreadCard(
    title: 'タイトル1',
    icon: Icons.star,
    onPress: () {
      print('タップされました');
    },
  ),
  ThreadCard(
    title: 'タイトル2',
    icon: Icons.star,
    onPress: () {
      print('タップされました');
    },
  ),
  ThreadCard(
    title: 'タイトル3',
    icon: Icons.star,
    onPress: () {
      print('タップされました');
    },
  ),
];



@widgetbook.UseCase(
  name: 'ThreadList',
  type: ThreadList,
)
ThreadList threadList(BuildContext context) {
  return ThreadList(
    threads: threads,
  );
}
