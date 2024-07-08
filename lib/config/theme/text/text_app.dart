import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';

class TextStyleApp {
  static final fontIbmPlexMonoText = GoogleFonts.ibmPlexMonoTextTheme();
  static final fontNotoSansButton = GoogleFonts.notoSans().copyWith(
      fontStyle: FontStyle.normal, fontWeight: FontWeight.w900, fontSize: 12);
  static final fontNotoSansTitle  = GoogleFonts.radioCanada().copyWith(
      fontStyle: FontStyle.normal, fontWeight: FontWeight.w900  , fontSize: 14);
  static final fontNotoSansLarge  = GoogleFonts.radioCanada().copyWith(
      fontStyle: FontStyle.normal, fontWeight: FontWeight.w900  , fontSize: 18);
  static final fontNotoSansDescription = GoogleFonts.radioCanada().copyWith(
      fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 12);

  static TextStyle textLargeSplash = const TextStyle(
      fontFamily: "BaronNeue",
      fontSize: 48,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      color: ColorApp.blackPrimary);
}
