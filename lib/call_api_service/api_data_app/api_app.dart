import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/service/config_api/call_api_config.dart';

import '../model/discount/discount_entity.dart';
import '../model/media_box/media_box_entity.dart';
import '../model/menu/menu_entity.dart';
import '../model/new_feed/new_feeds_entity.dart';
import '../model/stores/stores_entity.dart';

class ApiApp extends DioConfig {
  final baseUrlAPi = AppConstants.BASE_URL_API;

  @override
  String baseUrl() {
    return "";
  }

  Future<dynamic> getNewFeed() async {
    final NewFeedsEntity newFeedsEntity;
    var _dio = await dio;
    try {
      var data = await _dio.get("$baseUrlAPi/api/v5/news/newsfeed");
      newFeedsEntity = NewFeedsEntity.fromJson(data.data);
      return newFeedsEntity;
    } on DioException catch (ex) {
      return "";
    }
  }

  Future<dynamic> getMenu() async {
    final MenuEntity menuEntity;
    var _dio = await dio;
    try {
      var data =
          await _dio.post("$baseUrlAPi/api/v5/menu", data: {"src": "TCH-WEB"});
      menuEntity = MenuEntity.fromJson(data.data);
      return menuEntity;
    } on DioException catch (ex) {
      return "";
    }
  }

  Future<dynamic> getMediaBox() async {
    final MediaBoxEntity mediaBoxEntity;
    var _dio = await dio;
    try {
      var data = await _dio.get("$baseUrlAPi/api/v5/media/media-box");
      mediaBoxEntity = MediaBoxEntity.fromJson(data.data);
      return mediaBoxEntity;
    } on DioException catch (ex) {
      return "";
    }
  }

  Future<dynamic> getStore() async {
    final StoresEntity storesEntity;
    var _dio = await dio;
    try {
      var data = await _dio.get("$baseUrlAPi/api/v5/stores/all");
      storesEntity = StoresEntity.fromJson(data.data);
      return storesEntity;
    } on DioException catch (ex) {
      return "";
    }
  }

  Future<dynamic> getDashBoard() async {
    final DiscountEntity discountEntity;
    var _dio = await dio;
    try {
      var data = await _dio.post("$baseUrlAPi/api/v5/coupon/dashboard",
          data: {"is_limit_order": true},
          options: Options(headers: {
            "Authorization":
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MTUxODQxMzEsIm5iZiI6MTcxNTE4NDEzMSwianRpIjoiZDUyNzcyYmItMDU1MS00ODM2LTgzOWEtYmM0NzI4ZTJjOTIxIiwiZXhwIjoxNzIyOTYwMTMxLCJpZGVudGl0eSI6MjA3MDMxMywiZnJlc2giOmZhbHNlLCJ0eXBlIjoiYWNjZXNzIiwidXNlcl9jbGFpbXMiOnsiZXh0IjoxNzI1NTUyMTMxLCJjcm1faWQiOjE5ODQwNDUsImRpZCI6ImQwNmIzNzU1NTk4MTRlMDcwOWMwNTU1NjQxNmE4ZWVkIiwianRpIjoiZjAxYmZjMGEtNDIzZS00OWRmLWI3YzktYWEyOGMyOGI5MjBhIn19.IaOnaGkaPm14YfJq86INTi_m0VJpPWA3RO--ma5j5Po"
          }));
      discountEntity = DiscountEntity.fromJson(data.data);
      return discountEntity;
    } on DioException catch (ex) {
      return "";
    }
  }
}
