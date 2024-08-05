import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/page.dart';
import 'package:the_coffee_house_leanning/pages/splash/logic.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.lazyPut(() => ManagerPageController());
  }

}