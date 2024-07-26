import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/pages/shop/widget/store_bottom_sheet.dart';
import 'package:the_coffee_house_leanning/repository/model/app_model.dart';

import '../../repository/model/store/store.dart';

enum TypeAcotionShopPage{BLOCK_ITEM_STORE}

class ShopController extends GetxController{
  final AppModel appModel = AppModel().instance;
  late List<Store> listStore ;
  late List<List<Widget>> listImage;

  final buttonMapListStore = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listStore = appModel.store;

  }

  void cilckAction(TypeAcotionShopPage typeAcotionShopPage, Store store){
    switch(typeAcotionShopPage){
      case TypeAcotionShopPage.BLOCK_ITEM_STORE:
        StoreBottomSheet(storeData: store, ).bottomSheetItemOrder(Get.context!);

    }
  }

}