import 'package:get/get.dart';

import '../../service/internet/check_internet.dart';

class SplashController extends GetxController{

  @override
  Future<void>onInit() async{
    //await Future.delayed(Duration(seconds: 10));
    await initService();
  }
  Future<void> initService ()async{
    await Get.putAsync(()=>CheckInernet().onInit(), permanent: true);
  }
}