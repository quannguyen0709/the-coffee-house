import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';

import 'package:the_coffee_house_leanning/pages/shop/widget/store_bottom_sheet.dart';
import 'package:the_coffee_house_leanning/repository/model/app_model.dart';

import '../../config/theme/color/color_app.dart';
import '../../repository/model/store/store.dart';

enum TypeAcotionShopPage { BLOCK_ITEM_STORE }

class ShopController extends GetxController {
  final AppModel appModel = AppModel();

  final checkUserEmpty = AppModel().userModel.obs;
  late List<Store> listStore;

  late List<List<Widget>> listImage;

  final buttonMapListStore = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listStore = appModel.store;
  }

  void cilckAction(TypeAcotionShopPage typeAcotionShopPage, Store store) {
    switch (typeAcotionShopPage) {
      case TypeAcotionShopPage.BLOCK_ITEM_STORE:
        StoreBottomSheet(
          storeData: store,
          mapWidget: mapWidget(LatLng(store.location.first.values.last, store.location.last.values.last)),
        ).bottomSheetItemOrder(Get.context!);
    }
  }

  Widget mapWidget(LatLng latLng){
    final homePin = Icons.home_filled;
    return FlutterMap(options: MapOptions(
      initialCenter: latLng,
      initialZoom: 16,
      interactiveFlags: InteractiveFlag.none,
    ), children: [
      TileLayer(
        urlTemplate: AppConstants.URL_TEMPLATE_MAP_SERVER,
      ),

      MarkerLayer(
        markers: [Marker(
            height: 10.0.wp,
            width: 10.0.wp,
            point: latLng,
            child: Icon(
              homePin,
              color: ColorApp.primaryColor,
              size: 7.0.wp,
            )
        )],
      ),
    ]);
  }
}
