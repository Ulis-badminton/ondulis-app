import 'package:flutter/material.dart';
import 'package:ondulis_app/components/organisms/header/appbar_with_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppBarWithIcon',
  type: AppBarWithIcon,
)

AppBarWithIcon appBarWithIcon(BuildContext context) {
  return AppBarWithIcon(
    title: 'プロフィール設定',
    onBackPressed: () {
      Navigator.of(context).pop();
    },
    // imagePath: 'https://firebasestorage.googleapis.com/v0/b/ondulis-app-dev.appspot.com/o/profileImages%2F1715092160346?alt=media&token=5d0218a6-99d3-4fdf-af00-7c04c0a9ed3e',
    onIconPressed: () {
      debugPrint('アイコンが押されました');
    },
  );
}
