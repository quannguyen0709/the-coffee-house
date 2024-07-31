import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/repository/model/app_model.dart';

class OtherSettingController extends GetxController{
  AppModel appModel = AppModel();
  final checkUserEmpty = AppModel().userModel.checkEmptyUser().obs;


}