import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/order/logic.dart';

class OrderBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OrderController());
  }

}