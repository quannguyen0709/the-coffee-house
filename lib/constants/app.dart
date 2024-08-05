import 'package:flutter/cupertino.dart';

class AppConstants{
  static const URL_TEMPLATE_MAP_SERVER = "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
  static const APP_NAME = "The Coffee House";
  static const BASE_URL_API = "https://api.thecoffeehouse.com";
  static heightStatusBar(BuildContext context) => MediaQuery.viewPaddingOf(context).top;
  static const CALL_NUMBER = '18006936';
  static const ADDRESS_FACEBOOK =  'https://www.facebook.com/The.Coffee.House.2014';
  static const ADDRESS_WEBSITE = 'https://thecoffeehouse.com';
  static const ADDRESS_EMAIL = 'hi@thecoffeehouse.vn';
}