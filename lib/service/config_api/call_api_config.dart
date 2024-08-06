import 'dart:async';

import 'package:dio/dio.dart';


abstract class DioConfig{
  final BaseOptions option = BaseOptions(
    connectTimeout:  Duration(seconds: 5),
    receiveTimeout:  Duration(seconds:  5),
  );



  Future<Dio> get dio async{
    return Dio(option);
  }


  Future<Dio> dioWithToken () async{
    // logic check token authen ....
    return Dio(option);
  }

  String baseUrl();

}