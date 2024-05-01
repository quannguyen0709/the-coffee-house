import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/service/internet/check_internet.dart';

class HomeController extends GetxController{
  final string = 5;
  final chekcInternet = Get.find<CheckInernet>();


  Future<void> checkInternet()async{
    await chekcInternet.voidCheckInternet();
  }

}