import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/discount/logic.dart';

import '../../config/theme/text/text_app.dart';

class DiscountPage extends GetView<DiscountController>{
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text("UU dai", style: TheCoffeeHouseText.textLargeSplash,),
    );
  }

}