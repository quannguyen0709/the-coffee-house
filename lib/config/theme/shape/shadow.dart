import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';

import '../color/color_app.dart';

class ShadowApp{
  static const smallShadow = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: ColorApp.shadow,
          blurRadius: ShapeApp.extraLarge,
          spreadRadius: ShapeApp.extraSmall,
        )
      ]
  );
}