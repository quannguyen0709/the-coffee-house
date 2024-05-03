import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/shop/logic.dart';

import '../../config/theme/text/text_app.dart';

class ShopPage extends GetView<ShopController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text("Cua hang ", style: TheCoffeeHouseText.textLargeSplash,),
    );
  }
  
}