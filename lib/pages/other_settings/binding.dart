import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/logic.dart';

class OtherSettingBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OtherSettingController());
  }

}