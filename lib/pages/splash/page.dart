import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/pages/splash/logic.dart';
import 'package:the_coffee_house_leanning/pages/splash/widget/on_board_widget.dart';

class SplashPage extends GetView<SplashController>{


  Widget body() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("THE" , style: TextStyleApp.textLargeSplash)),
          Center(child: Text("COFFEE " , style: TextStyleApp.textLargeSplash)),
          Center(child: Text("HOUSE" , style: TextStyleApp.textLargeSplash))
        ],
      ),
    );
  }

  appBar() {
    return AppBar(
      title: Text(AppConstants.APP_NAME, style:  TextStyleApp.fontIbmPlexMonoText.bodyLarge,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: controller.initService(context), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Scaffold(body: body(),);
      }else if(snapshot.connectionState == ConnectionState.done){
        return onBardWidget();

      }else if(snapshot.hasError){

      };

      return Container();
    },);
  }


}