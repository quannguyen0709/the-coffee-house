import 'package:flutter/services.dart';

class LoadFileInAsset {
  static Future<String> readJson({required String path})async{
    String jsonData = await rootBundle.loadString(path);
    return jsonData;
  }

}