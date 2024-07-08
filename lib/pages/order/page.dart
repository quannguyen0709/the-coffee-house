import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/home/logic.dart';
import 'package:the_coffee_house_leanning/pages/home/page.dart';
import 'package:the_coffee_house_leanning/pages/order/logic.dart';

import '../../config/theme/color/color_app.dart';
import '../../config/theme/text/text_app.dart';
import '../../widgets/component_widget/component_item_order/item_order_wiget.dart';
import '../../widgets/image_widget/image_widget.dart';



class OrderPage extends StatelessWidget{
  final homeController = Get.find<HomeController>();
  final orderController = Get.find<OrderController>();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorApp.backgourdWhite,
      body: Obx(() => body()),
      appBar: appBarSliverOrder(),
    );
  }

  Widget body() {
    if (orderController.managerControll.value) {
      orderController.itemScrollController
          .scrollTo(index: 0, duration: Duration(seconds: 1));
      orderController.managerControll.value = false;
    }
    final listWidget = [orderController.listItemWidget, for(Widget itemFilter in orderController.listWidgetFilter) itemFilter];

    return ScrollablePositionedList.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemScrollController: orderController.itemScrollController,
      itemPositionsListener: orderController.itemPositionsListener,
      itemCount: listWidget.length,
      itemBuilder: (context, index) {
        return listWidget.elementAt(index);
      },
    );
  }

  AppBar appBarSliverOrder() {
    final leadingWidth = 70.0.wp;
    return AppBar(
        backgroundColor: Colors.white,
        leadingWidth: leadingWidth,
        toolbarHeight: 17.0.wp,
        leading: Obx(() => Container(
            margin: EdgeInsets.all(5.0.wp),
            child: widgetLeading(
                orderController.checkIndex.value, orderController.indexItem.value - 1))),
        actions: [actionWidget()],
        bottom: const PreferredSize(
          preferredSize: Size.zero,
          child: Divider(
            height: 0.5,
          ),
        ));
  }

  Widget actionWidget() {
    final IconData iconSearch = Icons.search_sharp;
    final IconData iconFavorite = Icons.favorite_border;
    return Container(
      margin: EdgeInsets.all(5.0.wp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              padding: EdgeInsets.only(right: 5.0.wp),
              child: Icon(
                iconSearch,
                size: 6.0.wp,
              )),
          Icon(
            iconFavorite,
            size: 6.0.wp,
          )
        ],
      ),
    );
  }

  widgetLeading(bool check, int index) {
    final TextStyle textStyle = TextStyleApp.fontNotoSansTitle;
    final IconData icon = Icons.keyboard_arrow_down;

    switch (check) {
      case false:
        return Row(
          children: [
            Text(
              'Danh Mục ',
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Icon(icon)
          ],
        );
      case true:
        return GestureDetector(
          onTap: () {
            HomePage().actionItemAppBar('', Get.context!, orderController.itemScrollController, 1);
          },
          child: Row(
            children: [
              SizedBox(
                width: 5.0.wp,
                child: homeController.listMenu[index][0],
              ),
              Text(
                homeController.listMenu[index][1],
                style: TextStyleApp.fontNotoSansLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Icon(icon)
            ],
          ),
        );
    }
  }

}
