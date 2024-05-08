import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ondulis_app/components/atoms/button/svg_button.dart';

@widgetbook.UseCase(
  name: 'SvgButton',
  type: SvgButton,
)
SvgButton svgButton(BuildContext context) {
  return SvgButton(
    svgAssetPath: 'assets/images/bad_mood.svg',
    onPressed: () {
      debugPrint('pressed');
    },
  );
}
