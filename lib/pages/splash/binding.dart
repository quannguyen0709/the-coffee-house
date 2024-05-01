import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/splash/logic.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }

}