import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/pages/splash/logic.dart';

class SplashPage extends GetView<SplashController>{
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
          Center(child: Text("THE" , style: TheCoffeeHouseText.textLargeSplash)),
          Center(child: Text("COFFEE " , style: TheCoffeeHouseText.textLargeSplash)),
          Center(child: Text("HOUSE" , style: TheCoffeeHouseText.textLargeSplash))
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