import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/pages/splash/binding.dart';
import 'package:the_coffee_house_leanning/routes/app_pages.dart';
import 'package:the_coffee_house_leanning/routes/app_routes.dart';
import 'package:the_coffee_house_leanning/service/internet/check_internet.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initService();
  runApp(const MyApp());
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

Future<void> initService ()async{
  await Get.putAsync(()=>CheckInernet().onInit());
}
