import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/discount/binding.dart';
import 'package:the_coffee_house_leanning/pages/discount/page.dart';
import 'package:the_coffee_house_leanning/pages/home/binding.dart';
import 'package:the_coffee_house_leanning/pages/home/page.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/binding.dart';
import 'package:the_coffee_house_leanning/pages/order/binding.dart';
import 'package:the_coffee_house_leanning/pages/order/page.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/binding.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/page.dart';
import 'package:the_coffee_house_leanning/pages/shop/binding.dart';
import 'package:the_coffee_house_leanning/pages/shop/page.dart';
import 'package:the_coffee_house_leanning/pages/splash/binding.dart';
import 'package:the_coffee_house_leanning/pages/splash/page.dart';
import 'package:the_coffee_house_leanning/routes/app_routes.dart';

import '../pages/manager_page/page.dart';

class AppPages{
  static List<GetPage> list = [
    GetPage(name: AppRoutes.SPLASH, page: ()=> SplashPage(), binding: SplashBinding()),
    GetPage(name: AppRoutes.MANAGER_PAGE, page: ()=> ManagerPage(), binding:  ManagerPageBinding())
  ];


  static List<GetPage> bottomNavigationBar = [
    GetPage(name: AppRoutes.HOME, page:()=> HomePage(), binding: HomeBinding(),),
    GetPage(name: AppRoutes.ORDER, page: ()=> OrderPage(), binding:  OrderBinding()),
    GetPage(name: AppRoutes.SHOP, page: ()=> ShopPage(), binding:  ShopBinding()),
    GetPage(name: AppRoutes.DISCOUNT, page: ()=> DiscountPage(), binding:  DiscountBinding()),
    GetPage(name: AppRoutes.OTHER_SETTINGS, page: ()=> OtherSettingPage(), binding:  OtherSettingBinding())
  ];


}