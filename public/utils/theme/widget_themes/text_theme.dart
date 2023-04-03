import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
      headline1: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        color: tPrimaryColor,
      ),
      headline2: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        color: tPrimaryColor,
      ),
      headline3: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        color: tPrimaryColor,
      ),
      headline4: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        color: tPrimaryColor,
      ),
      headline5: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        color: tPrimaryColor,
      ),
      headline6: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        color: tPrimaryColor,
      ),
      subtitle1: GoogleFonts.poppins(
        color: Colors.black87,
        fontSize: 20,
      ),
      subtitle2: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
      ),
      bodyText1: GoogleFonts.poppins(
        color: Colors.black87,
        fontSize: 20,
      ),
      bodyText2: GoogleFonts.poppins(
        color: Colors.black87,
        fontSize: 18,
      )
  );
}
