import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class TElevatedButtonTheme{
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
  );
}