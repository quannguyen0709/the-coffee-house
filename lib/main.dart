import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/pages/splash/binding.dart';
import 'package:the_coffee_house_leanning/routes/app_pages.dart';
import 'package:the_coffee_house_leanning/routes/app_routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  await hiveSetup();
  runApp(const MyApp());
}


Future<void> hiveSetup()async{
  final pathDirectory = await getApplicationDocumentsDirectory();
  Hive.init(pathDirectory.path);
  await Hive.openBox(AppConstants.NAME_BOX_HIVE);
   AppConstants.FRIST_LAUNCH_APP  = Hive.box(AppConstants.NAME_BOX_HIVE).get('frist_launch_app',defaultValue:  true) ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      // App title
      title: AppConstants.APP_NAME,
      getPages: AppPages.list,
      initialBinding: SplashBinding(),
      initialRoute: AppRoutes.SPLASH,

    );
  }
}


