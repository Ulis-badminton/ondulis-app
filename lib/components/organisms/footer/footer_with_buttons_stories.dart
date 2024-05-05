import 'package:flutter/material.dart';
import 'package:ondulis_app/components/organisms/footer/footer_with_buttons.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'FooterWithButtons',
  type: FooterWithButtons,
)
FooterWithButtons footerWithButtons(BuildContext context) {
  return FooterWithButtons(
    leftButtonText: const Text('ルームを作成'),
    leftButtonOnPress: () {
      debugPrint('ルームを作成');
    },
    rightButtonText: const Text('ルームに参加'),
    rightButtonOnPress: () {
      debugPrint('ルームに参加');
    },
  );
}
