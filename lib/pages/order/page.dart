import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/order/logic.dart';

import '../../config/theme/text/text_app.dart';

class OrderPage extends GetView<OrderController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text(" Dat hang ", style: TheCoffeeHouseText.textLargeSplash,),
    );
  }
  
}