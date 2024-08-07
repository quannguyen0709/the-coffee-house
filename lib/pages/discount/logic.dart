import 'dart:convert';

import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';
import 'package:the_coffee_house_leanning/repository/model/app_model.dart';
import 'package:the_coffee_house_leanning/repository/model/rank_infor/rank_infor_model.dart';

class DiscountController extends GetxController{
  List<RankInfor> rankInfor = AppModel().rankInfor;
  final pathDirectory = 'assets/rank_icon_tch/';
  final AppModel appModel = AppModel();
  late Rx<RankInfor> selectRankInfor ;
  final checkUser = ManagerPageController().checkEmptyUser;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    selectRankInfor = rankInfor.first.obs;
  }


}