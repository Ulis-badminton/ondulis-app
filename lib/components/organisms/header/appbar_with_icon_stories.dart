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
    imagePath: 'assets/images/icon.jpg',
    onIconPressed: () {
      debugPrint('アイコンが押されました');
    },
  );
}
