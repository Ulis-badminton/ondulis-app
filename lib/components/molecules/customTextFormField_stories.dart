import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ondulis_app/components/molecules/customTextFormField.dart';

@widgetbook.UseCase(
  name: 'CustomTextFormField',
  type: CustomTextFormField,
)
CustomTextFormField customTextField(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  return CustomTextFormField(
    controller: 
    emailController, 
    labelText: 'メールアドレス',
  );
}
