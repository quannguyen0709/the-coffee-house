import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/splash/binding.dart';
import 'package:the_coffee_house_leanning/pages/splash/page.dart';
import 'package:the_coffee_house_leanning/routes/app_routes.dart';

class AppPages{
  static List<GetPage> list = [
    GetPage(name: AppRoutes.SPLASH, page: ()=> SplashPage(), binding: SplashBinding())
  ];
}