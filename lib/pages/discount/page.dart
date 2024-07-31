import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/discount/logic.dart';

import '../../config/theme/text/text_app.dart';

class DiscountPage extends GetView<DiscountController>{
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: bodyPage(context),
    );
  }


  Widget bodyPage(BuildContext context){
    final heightStatusBar = AppConstants.heightStatusBar(context);
    return Container(
      color: ColorApp.backgourdGrey.withOpacity(0.1),
      height: 100.0.hp,
      width: 100.0.wp,
      child: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container();
  }

}