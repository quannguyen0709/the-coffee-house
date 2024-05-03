import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/shop/logic.dart';

class ShopBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ShopController());
  }

}