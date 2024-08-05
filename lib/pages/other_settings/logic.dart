import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/widget/web_view_post.dart';
import 'package:the_coffee_house_leanning/repository/model/app_model.dart';

class OtherSettingController extends GetxController{
  AppModel appModel = AppModel();
  final checkUserEmpty = AppModel().userModel.obs;


  void actionClick(String url, String title){
    Get.to(WebView(
        linkUrl: url, title: title));
  }

}