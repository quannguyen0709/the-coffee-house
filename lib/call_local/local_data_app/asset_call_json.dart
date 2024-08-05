import 'package:flutter/services.dart' show rootBundle;

class JsonFromAsset {
  static final JsonFromAsset _instance = JsonFromAsset._singleton();

  static const String pathAssetJsonDirectory  = 'assets/dedfault_config_resouce/';

  factory JsonFromAsset(){
    return _instance;
  }

  JsonFromAsset._singleton() ;

  Future<String> loadAsset(String file) async {
    return await rootBundle.loadString(pathAssetJsonDirectory + file);
  }
}