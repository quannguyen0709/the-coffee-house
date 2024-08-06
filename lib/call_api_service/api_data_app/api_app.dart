import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:the_coffee_house_leanning/call_local/local_data_app/asset_call_json.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/repository/model/app_model.dart';
import 'package:the_coffee_house_leanning/service/config_api/call_api_config.dart';

import '../model/discount/discount_entity.dart';
import '../model/media_box/media_box_entity.dart';
import '../model/menu/menu_entity.dart';
import '../model/new_feed/new_feeds_entity.dart';
import '../model/stores/stores_entity.dart';

class ApiApp extends DioConfig {
  final baseUrlAPi = AppConstants.BASE_URL_API;
  final hiveBox = Hive.box(AppConstants.NAME_BOX_HIVE);

  @override
  String baseUrl() {
    return "";
  }

  Future<dynamic> getNewFeed() async {
    final newFeedHive = 'new_feed';
    final NewFeedsEntity newFeedsEntity;
    var _dio = await dio;
    try {
      var data = await _dio.get("$baseUrlAPi/api/v5/news/newsfeed");
      newFeedsEntity = NewFeedsEntity.fromJson(data.data);
      // final test = jsonEncode(data.data);
      //print(test);
      await hiveBox.put(newFeedHive, jsonEncode(data.data));
      return newFeedsEntity;
    } on DioException catch (ex) {
      if (AppConstants.FRIST_LAUNCH_APP) {
         print("newfeed frist launch dont respone data ");
         return null;
      } else {
          //return (await hiveBox.get(newFeedHive)).toString();
        return hiveBox.get(newFeedHive) == null ? null : await NewFeedsEntity.fromJson(await jsonDecode(await hiveBox.get(newFeedHive)) )  ;
      }
    }
  }

  Future<dynamic> getMenu() async {
    final menuHive = 'menu_hive';
    final MenuEntity menuEntity;
    var _dio = await dio;
    try {
      var data =
          await _dio.post("$baseUrlAPi/api/v5/menu", data: {"src": "TCH-WEB"});
      await hiveBox.put(menuHive,jsonEncode(data.data)) ;
      menuEntity = MenuEntity.fromJson(data.data);
      return menuEntity;
    } on DioException catch (ex) {
      if (AppConstants.FRIST_LAUNCH_APP) {
         print("menu frist launch dont respone data ");
         return null;
      } else {
         return hiveBox.get(menuHive) == null ? null : await MenuEntity.fromJson(await jsonDecode(await hiveBox.get(menuHive)));

      }
    }
  }

  Future<dynamic> getMediaBox() async {
    final mediaBoxHive = 'media_box_hive';
    final MediaBoxEntity mediaBoxEntity;
    var _dio = await dio;
    try {
      var data = await _dio.get("$baseUrlAPi/api/v5/media/media-box");
      await hiveBox.put(mediaBoxHive, jsonEncode(data.data)) ;
      mediaBoxEntity = MediaBoxEntity.fromJson(data.data);
      return mediaBoxEntity;
    } on DioException catch (ex) {
      if (AppConstants.FRIST_LAUNCH_APP) {
         print("media box frist launch dont respone data ");
         return null;
      } else {
        final test = await hiveBox.get(mediaBoxHive);
        return hiveBox.get(mediaBoxHive) == null ? null : await MediaBoxEntity.fromJson(await jsonDecode(test));
      }
    }
  }

  Future<dynamic> getStore() async {
    final storeHive = 'store_hive';
    final StoresEntity storesEntity;
    var _dio = await dio;
    try {
      var data = await _dio.get("$baseUrlAPi/api/v5/stores/all");
      await hiveBox.put(storeHive, jsonEncode(data.data));
      storesEntity = StoresEntity.fromJson(data.data);
      return storesEntity;
    } on DioException catch (ex) {
      if (AppConstants.FRIST_LAUNCH_APP) {
         print("store frist launch dont respone data " );
         return null;
      } else {
        return hiveBox.get(storeHive) == null ? null : await StoresEntity.fromJson(await jsonDecode(await hiveBox.get(storeHive)));
      }
    }
  }

  Future<DiscountEntity> getDashBoard() async {
    final discountHive = 'discount_hive';
    final DiscountEntity discountEntity;
    var _dio = await dio;
    try {
      var data = await _dio.post("$baseUrlAPi/api/v5/coupon/dashboard",
          data: {"is_limit_order": true},
          options: Options(headers: {

            "Authorization":
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MTUxODQxMzEsIm5iZiI6MTcxNTE4NDEzMSwianRpIjoiZDUyNzcyYmItMDU1MS00ODM2LTgzOWEtYmM0NzI4ZTJjOTIxIiwiZXhwIjoxNzIyOTYwMTMxLCJpZGVudGl0eSI6MjA3MDMxMywiZnJlc2giOmZhbHNlLCJ0eXBlIjoiYWNjZXNzIiwidXNlcl9jbGFpbXMiOnsiZXh0IjoxNzI1NTUyMTMxLCJjcm1faWQiOjE5ODQwNDUsImRpZCI6ImQwNmIzNzU1NTk4MTRlMDcwOWMwNTU1NjQxNmE4ZWVkIiwianRpIjoiZjAxYmZjMGEtNDIzZS00OWRmLWI3YzktYWEyOGMyOGI5MjBhIn19.IaOnaGkaPm14YfJq86INTi_m0VJpPWA3RO--ma5j5Po"
          }));
      //await hiveBox.put(discountHive, data.data);
      discountEntity = DiscountEntity.fromJson(data.data);
      return discountEntity;
    } on DioException catch (ex) {

      return AppConstants.FRIST_LAUNCH_APP ?  DiscountEntity.fromJson(jsonDecode(await JsonFromAsset().loadAsset('discount_respone.json'))) : DiscountEntity.fromJson(hiveBox.get(discountHive, defaultValue: jsonDecode(await JsonFromAsset().loadAsset('discount_respone.json'))));



    }
  }
}
