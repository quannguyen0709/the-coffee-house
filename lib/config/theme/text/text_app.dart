import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';

class TheCoffeeHouseText {
  static final fontIbmPlexMonoText = GoogleFonts.ibmPlexMonoTextTheme();
  static final fontMontserratButton = GoogleFonts.montserrat().copyWith(
      fontStyle: FontStyle.normal, fontWeight: FontWeight.w900, fontSize: 12);

  static TextStyle textLargeSplash = TextStyle(
      fontFamily: "BaronNeue",
      fontSize: 48,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      color: TheCoffeeHouseColor.blackPrimary);
}
