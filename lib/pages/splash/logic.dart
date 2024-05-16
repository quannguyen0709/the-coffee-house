import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/call_api_service/call_api.dart';

import '../../service/internet/check_internet.dart';

class SplashController extends GetxController{

  @override
  Future<void>onInit() async{
    //await Future.delayed(Duration(seconds: 10));
  }
  Future<void> initService (BuildContext context)async{
    await Get.putAsync(()=>CheckInernet( context: context).onInit(), permanent: true);
    await Get.putAsync(()=>  CallApi().onInit(), permanent: true);
  }
}