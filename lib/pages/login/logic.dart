import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';
import 'package:the_coffee_house_leanning/repository/model/app_model.dart';

class LoginController extends GetxController{
  final AppModel appModel = AppModel();
  final checkEmptyUser = ManagerPageController().checkEmptyUser;
}