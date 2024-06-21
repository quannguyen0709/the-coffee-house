
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/home/widget/widget.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';
import 'package:the_coffee_house_leanning/repository/model/app_model.dart';
import 'package:the_coffee_house_leanning/widgets/image_widget/image_widget.dart';

import '../../repository/model/menu /menu.dart';
import '../../repository/model/new_feed/new_feed.dart';
import '../../service/internet/check_internet.dart';

enum TypeAction { BLOCK_ITEM_SEARCH, BLOCK_ITEM_BLOG, BLOCK_ITEM_ORDER , BLOCK_ITEM_APP_BAR}

class HomeController extends GetxController {
  final chekcInternet = Get.find<CheckInernet>();

  AppModel appModel = AppModel().instance;

  final managerControll = ManagerPageController.checkScroll;

  List<String> itemListCarouselSilder = [];
  List<dynamic> listMenu = [];
  Map<String, Product> listProduct = {};
  List<NewFeed> listNewFeed = [];
  Map<String, Post> listPost = {};


  final List<int> visibleIndexes = [];
  final int listIndexLive = 3;
  final  firstIndex = 0.obs;
  final checkChangeIcon = false.obs;

  final offSetChange = 0.0.obs;
  final ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();
  final ItemScrollController itemScrollControllerScreen =
      ItemScrollController();
  final ItemPositionsListener itemPositionsListenerScreen =
      ItemPositionsListener.create();

  var priceChose = 0 ;



  @override
  void onInit() {
    super.onInit();
    loadData();
    itemPositionsListenerScreen.itemPositions.addListener(() {
      return _logVisibleItems();
    },);
    scrollOffsetListener.changes.listen((event) {
      offSetChange.value = event;
      print('offset: ' + offSetChange.value.toString());
    });
  }

  void _logVisibleItems() {
    final positions = itemPositionsListenerScreen.itemPositions.value;
     visibleIndexes.clear();
    positions.forEach((element) {visibleIndexes.add(element.index);});

    checkIndexFirst(visibleIndexes);
    print('Visible items: $visibleIndexes');
  }

  void checkIndexFirst(List<int> visibleIndexes) {
    if(visibleIndexes.first < listIndexLive){
      checkChangeIcon.value = false;
      firstIndex.value = visibleIndexes.first;
    }else{
      checkChangeIcon.value = true;
      firstIndex.value = visibleIndexes.first - listIndexLive;
    }
  }


  bool checkOffSet(){
    return offSetChange.value < 0 ;
  }



  void loadData() {
    listProduct = appModel.listProducts;
    listNewFeed = appModel.newFeed;

    int length = (appModel.mediaBox.length / 2).round();
    for (int i = length; i < appModel.mediaBox.length; i++) {
      itemListCarouselSilder.add(appModel.mediaBox.elementAt(i).icon);
    }

    appModel.menu.forEach((element) {
      listMenu.add(
          [widgetImageNetWork(element.thumbnail), element.name, element.id]);
    });

    appModel.newFeed.forEach((elementNewFeed) {
      String nameNewFeed = elementNewFeed.name + ":";
      elementNewFeed.listPost.forEach((elementPost) {
        listPost.addAll({nameNewFeed + elementPost.id: elementPost});
      });
    });


  }

  printindex(String fris) {
    print('frist index: ' + fris);
  }

  List<Post> listPostByGroupName(String id) {
    List<Post> listPostByName = [];
    listPost.forEach((key, value) {
      if (id == (key.split(':')[0])) {
        listPostByName.add(value);
      }
    });
    return listPostByName;
  }

  List<Product> listProductMenuId(String id) {
    List<Product> listProducMenu = [];
    listProduct.forEach((key, value) {
      if (id == (key.split(' ')[0])) {
        listProducMenu.add(value);
      }
    });
    return listProducMenu;
  }

  void actionClickButton(String idAction, TypeAction action,
      {BuildContext? context}) {
    switch (action) {
      case TypeAction.BLOCK_ITEM_SEARCH:
        actionItemSearch(idAction);

      case TypeAction.BLOCK_ITEM_BLOG:
        actionItemBlog(idAction);

      case TypeAction.BLOCK_ITEM_ORDER:
        actionItemOrder(idAction);
      case TypeAction.BLOCK_ITEM_APP_BAR:
        //actionItemAppBar(idAction, context!);
    }
  }

  void actionItemSearch(String idAction) {
    if (idAction == 'search') {
      print('search in action item search');
    } else if (idAction == 'favorite') {
      print('favorite in action item search');
    } else {
      final action = idAction.split('_')[0];
      itemScrollControllerScreen.jumpTo(index: int.parse(action));
    }
  }

  void actionItemBlog(String idAction) {}

  void actionItemOrder(String idAction) {
    final checkId = idAction.split('_');
    priceChose = 0;
    switch(checkId[0]){
      case 'widgetAction':
        BottomApppSheet().bottomSheetItemOrder(Get.context!, findProduct(checkId), priceChose);
      case 'iconButton'  :
        BottomApppSheet().bottomSheetItemOrder(Get.context!, findProduct(checkId), priceChose);
    }
  }

  Product? findProduct(List<String> idCheck) {
    List<Product>? elementListProduct = listProductMenuId(idCheck[1]);
    Product? elementProduct = elementListProduct?.firstWhere((element) => element.id == idCheck[2]);
    priceChose = priceChose + elementProduct!.basePrice;
    elementProduct!.listOptions.forEach((element) {
      if(element.defaultIndex != -1){
        priceChose = priceChose + element.listItems.elementAt(element.defaultIndex).price;
      }
    });
    return elementProduct;
  }


  onTapOption(){

  }




// Future<Widget> widgetImage(String image)async{
//   return  Container(child: Image(image: AssetImage(image),fit: BoxFit.cover,),decoration: BoxDecoration(
//     color: Colors.blue,
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(15.0),
//       bottomRight: Radius.circular(15.0),
//   )));
// }
}
