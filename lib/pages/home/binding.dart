import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/home/logic.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeController());
  }

}