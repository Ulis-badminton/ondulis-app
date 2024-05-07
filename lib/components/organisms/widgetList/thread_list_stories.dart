import 'package:flutter/material.dart';
import 'package:ondulis_app/components/organisms/widgetList/thread_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ondulis_app/components/molecules/container/thread_card.dart';

final imagePath = 'https://www.google.com/imgres?q=redbull&imgurl=https%3A%2F%2Flookaside.fbsbx.com%2Flookaside%2Fcrawler%2Fmedia%2F%3Fmedia_id%3D100078922186837&imgrefurl=https%3A%2F%2Fwww.facebook.com%2FRedBullGaming%2F%3Flocale%3Dja_KS&docid=GYLqHxUnBX3ixM&tbnid=OkK-5k01QWyJ_M&vet=12ahUKEwiMsqqsvvuFAxXksVYBHVotAzkQM3oECEwQAA..i&w=800&h=800&hcb=2&itg=1&ved=2ahUKEwiMsqqsvvuFAxXksVYBHVotAzkQM3oECEwQAA';

List<ThreadCard> threads = [
  ThreadCard(
    title: 'タイトル1',
    profileImagePath: imagePath,
    onPress: () {
      print('タップされました');
    },
  ),
  ThreadCard(
    title: 'タイトル2',
    profileImagePath: imagePath,
    onPress: () {
      print('タップされました');
    },
  ),
  ThreadCard(
    title: 'タイトル3',
    profileImagePath: imagePath,
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
