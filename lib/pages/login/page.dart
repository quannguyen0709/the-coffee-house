import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/login/logic.dart';

import '../../config/theme/color/color_app.dart';
import '../../config/theme/text/text_app.dart';
import '../../constants/app.dart';

class LoginPage extends GetView<LoginController> {
  Rx<double> checkShowKeyboard = 0.0.obs;
  Rx<String> checkPhoneNumber = '0'.obs;

  @override
  Widget build(BuildContext context) {
    checkShowKeyboard.value =  MediaQuery.of(context).viewInsets.bottom;
    final heightStatusBar = AppConstants.heightStatusBar(context);
    return Scaffold(
      body: bodyPage(heightStatusBar, context),
    );
  }

  Widget bodyPage(heightStatusBar, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 100.0.hp,
        width: 100.0.wp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(flex: 30 ,child: Container(width: 100.0.wp, child: Image.asset('assets/icon_app/chien-luoc-kinh-doanh-the-coffee-house-2.png', fit: BoxFit.cover,),)),
            Expanded(flex : 13, child: Container(width: 100.0.wp, child: titleBrand(),)),
            Expanded(flex : 18,child: loginNumber()),
            Expanded(flex: 6,child: Container(width: 100.0.wp, alignment: Alignment.center,child: Text('Hoặc', style: TextStyleApp.fontNotoSansTitle.copyWith(color: ColorApp.backgourdGrey.withOpacity(1)),),)),
            Expanded(flex: 33, child: loginOther())
          ],
        ),
      ),
    );
  }

  Widget loginNumber() {
    final addressNumber = '+84';
    return Container(
      margin: EdgeInsets.only(left: 5.0.wp, right: 5.0.wp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:  CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(() => Container(
            padding: EdgeInsets.only(top: 1.0.wp, bottom: 1.0.wp, right:  3.0.wp, left: 3.0.wp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
              border: Border.all(color: checkShowKeyboard.value != 0 ? ColorApp.primaryColorSwatch.shade700 : ColorApp.backgourdGrey.withOpacity(0.4)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 7.0.wp,
                  height: 7.0.wp,
                  child: Image.asset('assets/icon_app/viet_nam_icon.png', fit: BoxFit.cover,),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(color: ColorApp.backgourdGrey.withOpacity(0.2))
                      )
                  ),
                  padding: EdgeInsets.only(right:  2.0.wp),
                  child: Text(
                    addressNumber,
                    style: TextStyleApp.fontNotoSansTitle.copyWith(color: ColorApp.backgourdGrey.withOpacity(0.7)),
                  ),
                ),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 2.0.wp),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nhập số điện thoại ',
                          hintMaxLines: 1,
                          hintStyle: TextStyleApp.fontNotoSansTitle.copyWith(color: ColorApp.backgourdGrey.withOpacity(1))
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          checkPhoneNumber.value = value;
                        },
                      ),
                    )
                )
              ],
            ),
          )),
          Obx(
          ()=> Container(
              height: 12.0.wp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
                color: checkPhoneNumber.value.isPhoneNumber ? ColorApp.primaryColorSwatch.shade700 : ColorApp.backgourdGrey.withOpacity(0.7)
              ),
              child: Text(
                'Đăng nhập',
                style: TextStyleApp.fontNotoSansTitle.copyWith(color: ColorApp.backgourdWhite),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget boxLoginIcon(Color colorBox, String text, Color colorText, IconData iconData){
    return Container(
      height: 12.0.wp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
          color: colorBox
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color:  ColorApp.backgourdWhite, size: 5.0.wp,),
          Container(width: 3.0.wp,),
          Text(
            text,
            style: TextStyleApp.fontNotoSansTitle.copyWith(color:colorText ),
          )
        ],
      ),
    );
  }

  Widget boxLoginImage(Color colorBox, String text, Color colorText, Image image){
    return Container(
      height: 12.0.wp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: ColorApp.backgourdGrey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
          color: colorBox
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 7.0.wp, child: image,),
          Container(width: 3.0.wp,),
          Text(
            text,
            style: TextStyleApp.fontNotoSansTitle.copyWith(color:colorText ),
          )
        ],
      ),
    );
  }

  Widget loginOther() {
    return Container(
      margin: EdgeInsets.only(left: 5.0.wp, right: 5.0.wp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          boxLoginIcon(ColorApp.blackPrimary, 'Tiếp tục bằng Apple', ColorApp.backgourdWhite, Icons.apple),
          Container(height: 5.0.wp),
          boxLoginIcon(ColorApp.buleIcon, 'Tiếp tục bằng Facebook', ColorApp.backgourdWhite, Icons.facebook),
          Container(height: 5.0.wp,),
          boxLoginImage(ColorApp.backgourdWhite, 'Tiếp tục bằng Google', ColorApp.blackPrimary, Image.asset('assets/icon_app/google_icon.png', fit: BoxFit.cover,))
        ],
      ),
    );
  }

  Widget titleBrand() {
    final textStyleTitleBrand =
    TextStyleApp.textLargeSplash.copyWith(fontSize: 30);
    final textStyleTitle = TextStyleApp.fontNotoSansTitle;
    final textStyleDescription = TextStyleApp.fontNotoSansDescription
        .copyWith(color: ColorApp.backgourdGrey.withOpacity(1));
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment:  CrossAxisAlignment.center,
      children: [
        Text('Chào mừng bạn đến với', style: textStyleDescription,),
        Text(AppConstants.APP_NAME, style: textStyleTitleBrand,)
      ],
    );
  }
}
