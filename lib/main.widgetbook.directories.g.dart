// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ondulis_app/components/atoms/text_field_stories.dart' as _i2;
import 'package:ondulis_app/components/molecules/customTextFormField_stories.dart'
    as _i3;
import 'package:ondulis_app/components/molecules/thread_card_stories.dart'
    as _i4;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'atoms',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'CustomTextField',
            useCase: _i1.WidgetbookUseCase(
              name: 'CustomTextField',
              builder: _i2.customTextField,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'molecules',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'CustomTextFormField',
            useCase: _i1.WidgetbookUseCase(
              name: 'CustomTextFormField',
              builder: _i3.customTextField,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'organisms',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ThreadCard',
            useCase: _i1.WidgetbookUseCase(
              name: 'ThreadCard',
              builder: _i4.threadCard,
            ),
          )
        ],
      ),
    ],
  )
];
