import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/home/page.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';

import '../../widgets/component_widget/component_list_item/list_item_widget.dart';
import '../../widgets/component_widget/component_list_item/searchBar.dart';
import '../home/logic.dart';

class OrderController extends GetxController{
  late ItemPositionsListener itemPositionsListener ;
  late  ItemScrollController itemScrollController;
  List<ItemPosition> listItem = [];

  final managerControll = ManagerPageController.checkScroll.elementAt(1);

  final homeController = Get.find<HomeController>();

  final checkIndex = false.obs;
  final indexItem = 0.obs;

  late List<Widget> listWidgetFilter ;
  late Widget listItemWidget ;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    itemPositionsListener = ItemPositionsListener.create();
    itemScrollController = ItemScrollController();

    listItemWidget =  ListItem(
        toolBar: false,
        indexLive: homeController.listIndexLive,
        list: homeController.listMenu,
        actionItem: homeController.actionClickButton,
        favoriteButton: buttonFavorite(homeController.actionClickButton),
        searchBar: SearchBarWidget(
          actionClick: homeController.actionClickButton,
          height: 3.0.hp,
        )).listItemNonToolBar(23.0.hp);

    listWidgetFilter = List<Widget>.generate(
        homeController.listMenu.length, (index) => HomePage().listItemOrderFilterOrderPage(index));


    itemPositionsListener.itemPositions.addListener(() {
      itemPositionChecker();
    });
  }

  void itemPositionChecker() {
    listItem.clear();
    listItem = itemPositionsListener.itemPositions.value.toList();
    if(listItem.first.index != 0){
      checkIndex.value = true;
      indexItem.value = listItem.first.index;
    }else{
      checkIndex.value = false;
      indexItem.value = listItem.first.index;
    }
  }





}