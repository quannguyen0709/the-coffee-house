import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:the_coffee_house_leanning/pages/home_page/logic.dart';

import '../../config/theme/text/text_app.dart';
import '../../constants/app.dart';

class HomePage extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  body(),
    );
  }

  Widget body() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("MAN" , style: TheCoffeeHouseText.textLargeSplash)),
          Center(child: Text("HINH " , style: TheCoffeeHouseText.textLargeSplash)),
          Center(child: Text("HOME" , style: TheCoffeeHouseText.textLargeSplash)),
          Center(child: Text(controller.toString()),),
          Center(child: FloatingActionButton(onPressed: () async{ await controller.checkInternet(); },),)
        ],
      ),
    );
  }

  appBar() {
    return AppBar(
      title: Text(AppConstants.APP_NAME, style:  TheCoffeeHouseText.fontIbmPlexMonoText.bodyLarge,),
    );
  }

}