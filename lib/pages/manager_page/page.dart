import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';

import '../../config/theme/text/text_app.dart';
import '../../constants/app.dart';
import '../../widgets/bottom_navigation_bar/bottom_navigation.dart';

class ManagerPage extends GetView<ManagerPageController>{

  @override
  Widget build(BuildContext context) {
    return ManagerScreen();
  }



  Widget ManagerScreen() {
    return Scaffold(
      body:  Obx(() => controller.changePage()),
      bottomNavigationBar:BottomNavigationWidget(
        color: controller.color,
        backGroundColor: controller.backGroundColor,
        listItem: [
          BottomNavigationItem(icon: controller.iconBottomNavigationBar[0], text: controller.titleBottomNavigationBar[0]),
          BottomNavigationItem(icon: controller.iconBottomNavigationBar[1], text: controller.titleBottomNavigationBar[1]),
          BottomNavigationItem(icon: controller.iconBottomNavigationBar[2], text: controller.titleBottomNavigationBar[2]),
          BottomNavigationItem(icon: controller.iconBottomNavigationBar[3], text: controller.titleBottomNavigationBar[3]),
          BottomNavigationItem(icon: controller.iconBottomNavigationBar[4], text: controller.titleBottomNavigationBar[4]),

        ],
        selectColor: controller.selectColor,
        selectItem: controller.onSelectItemNavigationBottom,
      ),

    );
  }

}