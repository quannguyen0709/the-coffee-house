import 'package:flutter/cupertino.dart';

class AppConstants{
  static const URL_TEMPLATE_MAP_SERVER = "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
  static const APP_NAME = "The Coffee House";
  static const BASE_URL_API = "https://api.thecoffeehouse.com";
  static heightStatusBar(BuildContext context) => MediaQuery.viewPaddingOf(context).top;
}