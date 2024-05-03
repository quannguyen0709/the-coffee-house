import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';

class ManagerPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ManagerPageController());
  }

}