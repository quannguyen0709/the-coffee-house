

import 'package:flutter/material.dart';



/*ColorSwatch
    50: Color(0xFF),
    100: Color(0xFF),
    200: Color(0xFF),
    300: Color(0xFF),
    400: Color(0xFF),
    500: Color(0xFF),
    600: Color(0xFF),
    700: Color(0xFF),
    800: Color(0xFF),
    900: Color(0xFF)*/

class  ColorApp{
  static const int primaryColorValue = 0xFFE57905;
  static  Color primaryColorVariantsValue = primaryColorSwatch.shade200;
  static Color primaryColor = primaryColorSwatch.shade700;
  static const  primaryColorSwatch  = MaterialColor(primaryColorValue, <int, Color>{
    50: Color(0xFFfdf2e0),
    100: Color(0xFFfadeb2),
    200: Color(0xFFf6c880),
    300: Color(0xFFf3b34e),
    400: Color(0xFFf1a229),
    500: Color(0xFFef930a),
    600: Color(0xFFeb8807),
    700: Color(primaryColorValue),
    800: Color(0xFFdf6a03),
    900: Color(0xFFd55102)
  });

  static const Color buleIcon = Color(0xFF0571e5);
  static const Color redIcon = Color(0xFFe50905);

  static const Color greenButton = Color(0xFF00af21);
  static const Color greenBackgourdButton = Color(0xFFc1f49c);

  static  Color orangeButton = primaryColorSwatch.shade700;
  static Color orangeBackgourdButton = primaryColorVariantsValue;

  static const backgourdWhite = Color(0xFFFFFFFF);
  static const backgourdGrey = Color(0xFF808080);

  static const textGrey = Color(0xFF5F5F5F);
  static const shadow  = Color(0xFFB8B8B8);



  static const iconColor = Color(0xFF808080);

  static const blackPrimary = Colors.black;

}