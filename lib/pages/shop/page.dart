
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:redacted/redacted.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/home/page.dart';
import 'package:the_coffee_house_leanning/pages/shop/logic.dart';
import 'package:the_coffee_house_leanning/pages/shop/widget/map_widget.dart';
import 'package:the_coffee_house_leanning/pages/shop/widget/store_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/theme/color/color_app.dart';
import '../../config/theme/text/text_app.dart';

class ShopPage extends GetView {
  final shopController = Get.find<ShopController>();

  ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build\
    return bodyPage(context);
  }

  Widget bodyPage(BuildContext context) {
    return Container(
      color: ColorApp.backgourdWhite,
      margin: EdgeInsets.only(top: AppConstants.heightStatusBar(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(),
          Obx(() => Expanded(
              child: shopController.buttonMapListStore.value
                  ? bodyListStore()
                  : bodyMapStore()))
        ],
      ),
    );
  }

  Widget bodyListStore() {
    final textTiltBody = 'Các cửa hàng khác';
    final textStyle =
        TextStyleApp.fontNotoSansLarge.copyWith(fontWeight: FontWeight.w900);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: ColorApp.backgourdGrey.withOpacity(0.1),
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3.0.wp),
                    child: Text(
                      textTiltBody,
                      style: textStyle,
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    cacheExtent: 0,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return StoreWidget(
                          store: shopController.listStore.elementAt(index),
                          axisScroll: AxisScroll.COLUM_SCROLL,
                          actionClickButton: shopController.cilckAction);
                    },
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget appBar() {
    final textTilteAppBar = 'Cửa hàng';
    final textStyle = TextStyleApp.fontNotoSansLarge
        .copyWith(fontSize: 20, fontWeight: FontWeight.w900);
    final heightAppBar = 25.0.wp;
    return Container(
      color: ColorApp.backgourdWhite,
      height: heightAppBar,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
            height: heightAppBar * 0.45,
            child: Center(
              child: Row(
                children: [
                  Text(
                    textTilteAppBar,
                    style: textStyle,
                  ),
                  Spacer(),
                  sticketDiscountWidget(9, heightAppBar * 0.8 * 0.45),
                  Container(
                    width: 2.0.wp,
                  ),
                  notificationWidget(heightAppBar * 0.8 * 0.45, 7)
                ],
              ),
            ),
          ),
          Container(
              height: heightAppBar * 0.55,
              padding: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
              child: Center(
                child: Row(
                  children: [
                    Expanded(child: searchBarWidget(heightAppBar * 0.8 * 0.55)),
                    Container(width: 2.0.wp),
                    Obx(() => GestureDetector(
                          onTap: () {
                            shopController.buttonMapListStore.value =
                                !shopController.buttonMapListStore.value;
                          },
                          child: buttonMapWidget(heightAppBar * 0.8 * 0.55),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget sticketDiscountWidget(int numberTicket, double heightWidget) {
    final ticketIcon = Icons.confirmation_num_outlined;
    final textStyle = TextStyleApp.fontNotoSansTitle;
    final width = heightWidget * 1.6;
    return Container(
      decoration: BoxDecoration(
          color: ColorApp.backgourdWhite,
          boxShadow: [
            BoxShadow(
              color: ColorApp.textGrey.withOpacity(0.4),
              spreadRadius: 0.05 * heightWidget,
              blurRadius: 10,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(ShapeApp.full),
          border: Border.all(color: ColorApp.textGrey.withOpacity(0.1))),
      height: heightWidget,
      padding: EdgeInsets.only(
        right: 0.2 * heightWidget,
        left: 0.2 * heightWidget,
      ),
      width: width,
      child: Center(
        child: Row(
          children: [
            Icon(
              ticketIcon,
              size: heightWidget * 0.7,
              color: ColorApp.primaryColor,
            ),
            Spacer(),
            Text(
              numberTicket.toString(),
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }

  Widget notificationWidget(double heightWidget, int numberNotification) {
    final notificationIcon = Icons.notifications_none_outlined;
    final textStyle = TextStyleApp.fontNotoSansDescription
        .copyWith(fontSize: 10, color: ColorApp.backgourdWhite);
    return Container(
      decoration: BoxDecoration(
          color: ColorApp.backgourdWhite,
          boxShadow: [
            BoxShadow(
              color: ColorApp.textGrey.withOpacity(0.4),
              spreadRadius: 0.05 * heightWidget,
              blurRadius: 10,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(ShapeApp.full),
          border: Border.all(color: ColorApp.textGrey.withOpacity(0.1))),
      height: heightWidget,
      width: heightWidget,
      child: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Icon(
              notificationIcon,
              size: 0.7 * heightWidget,
              color: ColorApp.textGrey,
            ),
            Positioned(
              bottom: 0.55 * heightWidget,
              left: 0.5 * heightWidget,
              child: Container(
                decoration: BoxDecoration(
                    color: ColorApp.redIcon, shape: BoxShape.circle),
                height: 0.4 * heightWidget,
                width: 0.4 * heightWidget,
                child: Center(
                  child: Text(
                    numberNotification.toString(),
                    style: textStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchBarWidget(double heightWidget) {
    final searchIcon = Icons.search_sharp;
    final textHide = 'Tìm kiếm';
    final textStyle = TextStyleApp.fontNotoSansTitle
        .copyWith(color: ColorApp.textGrey.withOpacity(0.6));
    return Container(
      padding: EdgeInsets.only(right: 3.0.wp, left: 3.0.wp),
      height: heightWidget,
      decoration: BoxDecoration(
        color: ColorApp.backgourdGrey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(
              searchIcon,
              size: 0.6 * heightWidget,
              color: ColorApp.textGrey,
            ),
            Container(
              width: 3.0.wp,
            ),
            Expanded(
                child: Text(
              textHide,
              style: textStyle,
            ))
          ],
        ),
      ),
    );
  }

  Widget buttonMapWidget(double heightWidget) {
    final textButtonList = 'Danh sách';
    final buttonListIcon = Icons.list_rounded;
    final mapIcon = Icons.map_outlined;
    final textButtonMap = 'Bản đồ';
    final textStyle = TextStyleApp.fontNotoSansTitle
        .copyWith(color: ColorApp.textGrey.withOpacity(0.6));
    return Container(
      padding: EdgeInsets.only(left: 3.0.wp),
      height: heightWidget,
      width: 35.0.wp,
      decoration: BoxDecoration(
        color: ColorApp.backgourdGrey.withOpacity(0.0),
        borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(
              shopController.buttonMapListStore.value
                  ? mapIcon
                  : buttonListIcon,
              size: 0.6 * heightWidget,
              color: ColorApp.textGrey,
            ),
            Container(
              width: 3.0.wp,
            ),
            Text(
              shopController.buttonMapListStore.value
                  ? textButtonMap
                  : textButtonList,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }

  Widget bodyMapStore() {
    return Container(
      child: MapWiget(
        shopController: shopController,
        URL_SERVER: AppConstants.URL_TEMPLATE_MAP_SERVER,
      ).MapContainer(),
    );
  }
}
