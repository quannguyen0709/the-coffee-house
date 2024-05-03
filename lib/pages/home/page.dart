import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/home/logic.dart';

class HomePage extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(height: 100.0.hp,width: 1000.0.wp,color: Colors.red,child: Text("Trang chu ", style: TheCoffeeHouseText.textLargeSplash,)),
    );
  }
  
}