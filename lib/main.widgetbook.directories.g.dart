// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ondulis_app/components/molecules/container/thread_card_stories.dart'
    as _i2;
import 'package:ondulis_app/components/molecules/textform/customTextFormField_stories.dart'
    as _i3;
import 'package:ondulis_app/components/organisms/footer/footer_with_buttons_stories.dart'
    as _i4;
import 'package:ondulis_app/components/organisms/header/appbar_with_icon_stories.dart'
    as _i5;
import 'package:ondulis_app/components/organisms/header/custom_appbar_stories.dart'
    as _i6;
import 'package:ondulis_app/components/organisms/widgetList/thread_list_stories.dart'
    as _i7;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'molecules',
        children: [
          _i1.WidgetbookFolder(
            name: 'container',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'ThreadCard',
                useCase: _i1.WidgetbookUseCase(
                  name: 'ThreadCard',
                  builder: _i2.threadCard,
                ),
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'textform',
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
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'organisms',
        children: [
          _i1.WidgetbookFolder(
            name: 'footer',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'FooterWithButtons',
                useCase: _i1.WidgetbookUseCase(
                  name: 'FooterWithButtons',
                  builder: _i4.footerWithButtons,
                ),
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'header',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'AppBarWithIcon',
                useCase: _i1.WidgetbookUseCase(
                  name: 'AppBarWithIcon',
                  builder: _i5.appBarWithIcon,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'CustomAppBar',
                useCase: _i1.WidgetbookUseCase(
                  name: 'CustomAppbar',
                  builder: _i6.customAppBar,
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'widgetList',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'ThreadList',
                useCase: _i1.WidgetbookUseCase(
                  name: 'ThreadList',
                  builder: _i7.threadList,
                ),
              )
            ],
          ),
        ],
      ),
    ],
  )
];
