import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/home_page/logic.dart';
import 'package:the_coffee_house_leanning/pages/home_page/page.dart';
import 'package:the_coffee_house_leanning/pages/splash/logic.dart';

class onBardWidget extends StatelessWidget{
  final splashController = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return homeScreen();
  }

  Widget homeScreen() {
    Get.lazyPut(() => HomeController());
    return HomePage();
  }

}