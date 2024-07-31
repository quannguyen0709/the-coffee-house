import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/call_api_service/api_data_app/api_app.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/discount/discount_entity.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/media_box/media_box_entity.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/menu/menu_entity.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/new_feed/new_feeds_entity.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/stores/stores_entity.dart';
import 'package:the_coffee_house_leanning/repository/model/app_model.dart';

class CallApi extends GetxService{
  final apiDataApp = ApiApp();
  final appModel = AppModel().instance;


  @override
  Future<CallApi> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await callApiApp();

    return this;
  }

  Future callApiApp()async{
    dynamic  discountEntity =  await apiDataApp.getDashBoard();
    final NewFeedsEntity newFeedsEntity = await apiDataApp.getNewFeed();
    final MenuEntity menuEntity = await apiDataApp.getMenu();
    final MediaBoxEntity mediaBoxEntity = await apiDataApp.getMediaBox();
    final StoresEntity storesEntity = await apiDataApp.getStore();



    await appModel.addConfigApp(storesEntity);
    await appModel.addConfigApp(newFeedsEntity);
    await appModel.addConfigApp(menuEntity);
    await appModel.addConfigApp(mediaBoxEntity);
    //await appModel.addConfigApp(discountEntity);




  }

}