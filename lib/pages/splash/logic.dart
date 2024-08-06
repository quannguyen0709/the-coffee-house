import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/call_api_service/call_api.dart';
import 'package:the_coffee_house_leanning/call_local/local_data_app/asset_call_json.dart';
import 'package:the_coffee_house_leanning/call_local/model/rank_infor/rank_infor_entity.dart';

import '../../repository/model/app_model.dart';
import '../../service/internet/check_internet.dart';

class SplashController extends GetxController {
  final appModel = AppModel();
  final JsonFromAsset jsonFromAsset = JsonFromAsset();

  @override
  Future<void> onInit() async {
    final test =await jsonFromAsset.loadAsset('rank_infor.json');
    appModel.addConfigApp(RankInforEntity.fromJson(
        jsonDecode(test)));
    //print(appModel.rankInfor.first.name);
    //print('');
    //await Future.delayed(Duration(seconds: 10));
  }

  Future<void> initService(BuildContext context) async {
    await Get.putAsync(() => CheckInernet(context: context).onInit(),
        permanent: true);
     Get.put(CallApi(), permanent: true);
     await CallApi().callApiApp();

    //appModel.rankInforEntity = RankInforEntity.fromJson();
  }
}
