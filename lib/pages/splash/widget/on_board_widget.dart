import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/binding.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/page.dart';

class onBardWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return managerScreen();
  }

  Widget managerScreen() {
    Get.put( ManagerPageController());
    return ManagerPage();
  }

}