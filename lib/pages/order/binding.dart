import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/home/logic.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';
import 'package:the_coffee_house_leanning/pages/order/logic.dart';

class OrderBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OrderController());
    Get.put(HomeController());
  }

}