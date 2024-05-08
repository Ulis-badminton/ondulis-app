import 'package:flutter/material.dart';
import 'package:ondulis_app/components/organisms/header/custom_appbar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'CustomAppBar',
  type: CustomAppBar,
)
CustomAppBar customAppBar(BuildContext context) {
  return CustomAppBar(
    title: 'プロフィール設定',
    onBackPressed: () {
      Navigator.of(context).pop();
    },
  );
}
