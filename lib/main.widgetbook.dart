// widgetbook.dart

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the generated directories variable
import 'main.widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

// The @App annotation generates a file containing
// a single variable called directories.
@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Use the generated directories variable
      directories: directories,
      addons: <WidgetbookAddon>[
        MaterialThemeAddon(
          themes: <WidgetbookTheme<ThemeData>>[
            WidgetbookTheme<ThemeData>(
              name: 'Light',
              data: ThemeData.light(),
            ),
            WidgetbookTheme<ThemeData>(
              name: 'Dark',
              data: ThemeData.dark(),
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: <DeviceInfo>[
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
          ],
        ),
        TextScaleAddon(
          scales: <double>[1.0, 2.0],
        ),
        LocalizationAddon(
          locales: <Locale>[
            const Locale('en', 'US'),
          ],
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
        ),
      ],
    );
  }
}