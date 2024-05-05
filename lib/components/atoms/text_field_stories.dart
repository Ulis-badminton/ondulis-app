import 'package:flutter/material.dart';
import 'package:ondulis_app/components/atoms/text_field.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'CustomTextField',
  type: CustomTextField,
)
CustomTextField customTextField(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  return CustomTextField(controller: emailController, label: 'メールアドレス');
}
