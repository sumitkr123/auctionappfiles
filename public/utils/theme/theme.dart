import 'widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outline_button_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepOrange,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
  );
}
