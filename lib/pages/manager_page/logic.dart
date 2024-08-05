import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/pages/discount/logic.dart';
import 'package:the_coffee_house_leanning/pages/home/logic.dart';
import 'package:the_coffee_house_leanning/pages/order/logic.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/logic.dart';
import 'package:the_coffee_house_leanning/pages/shop/logic.dart';
import 'package:the_coffee_house_leanning/routes/app_pages.dart';
import 'package:the_coffee_house_leanning/service/internet/check_internet.dart';

class ManagerPageController extends GetxController{
  final string = 5;
  final chekcInternet = Get.find<CheckInernet>();
  final bottomNavigationBar = AppPages.bottomNavigationBar;
  final  currentPage = 0.obs;
  final Color backGroundColor = ColorApp.backgourdWhite;
  final List<Color> selectColor = [ColorApp.primaryColorSwatch.shade900,  ColorApp.primaryColor];
  final Color color = ColorApp.iconColor;
  final List<String> titleBottomNavigationBar = ["Trang chủ","Đặt hàng ","Cửa hàng", " Ưu đãi ", "Khác"];
  final List<IconData> iconBottomNavigationBar = [Icons.home_outlined, Icons.local_cafe_outlined, Icons.storefront, Icons.confirmation_number, Icons.list ];

  static final checkScroll = [false.obs, false.obs, false.obs, false.obs, false.obs];


  @override
   onInit(){
    bindingPage();
    super.onInit();

  }

  void onSelectItemNavigationBottom(int item){
    if(item != currentPage.value){
      currentPage.value = item;
    }
    else if (item == currentPage.value){
      switch(item){
        case 0:
          checkScroll.elementAt(0).value = true;
        case 1:
          checkScroll.elementAt(1).value = true;
        case 2:
          checkScroll.elementAt(2).value = true;
        case 3:
          checkScroll.elementAt(3).value = true;
        case 4:
          checkScroll.elementAt(4).value = true;
      }
    }
  }

  Widget changePage(){
    return bottomNavigationBar[currentPage.value].page();
  }


  Future<void> checkInternet()async{
    await chekcInternet.voidCheckInternet();
  }

   bindingPage()  {
    Get.put(HomeController());
    Get.put( OrderController());
    Get.lazyPut(() => ShopController());
    Get.lazyPut(() => DiscountController());
    Get.put(OtherSettingController());
  }



}