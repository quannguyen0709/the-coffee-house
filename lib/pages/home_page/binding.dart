import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/home_page/logic.dart';
import 'package:the_coffee_house_leanning/pages/splash/logic.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}