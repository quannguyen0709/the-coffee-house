

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/logic.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/widget/list_item_widget.dart';

import '../../config/theme/color/color_app.dart';
import '../../config/theme/shape/shape_app.dart';
import '../../config/theme/text/text_app.dart';
import '../../constants/app.dart';

class OtherSettingPage extends GetView<OtherSettingController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage(context);
  }

  Widget bodyPage(BuildContext context) {
    return Container(
      color: ColorApp.backgourdWhite,
      margin: EdgeInsets.only(top: AppConstants.heightStatusBar(context)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [appBar(), Expanded(child: bodyPageOtherSetting())],
      ),
    );
  }

  Widget appBar() {
    final textTilteAppBar = 'Khác';
    final textStyle = TextStyleApp.fontNotoSansLarge
        .copyWith(fontSize: 20, fontWeight: FontWeight.w900);
    final heightAppBar = 25.0.wp * 0.45;
    return Container(
      color: ColorApp.backgourdWhite,
      height: heightAppBar + 4.0.wp,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
              height: heightAppBar,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      textTilteAppBar,
                      style: textStyle,
                    ),
                    Spacer(),
                    sticketDiscountWidget(9, heightAppBar * 0.8),
                    Container(
                      width: 2.0.wp,
                    ),
                    notificationWidget(heightAppBar * 0.8, 7)
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //     height: heightAppBar * 0.55,
          //     padding: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
          //     child: Center(
          //       child: Row(
          //         children: [
          //           Expanded(child: searchBarWidget(heightAppBar * 0.8 * 0.55)),
          //           Container(width: 2.0.wp),
          //           Obx(() => GestureDetector(
          //             onTap: () {
          //               shopController.buttonMapListStore.value =
          //               !shopController.buttonMapListStore.value;
          //             },
          //             child: buttonMapWidget(heightAppBar * 0.8 * 0.55),
          //           ))
          //         ],
          //       ),
          //     ))
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

  Widget bodyPageOtherSetting() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: ColorApp.backgourdGrey.withOpacity(0.1),
        ),
        Container(
          margin: EdgeInsets.only(right: 5.0.wp, left:  5.0.wp),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[extensionWidget() ,supportWidget(), accountWidget(), Container(height: 7.0.wp,)],
            ),
          ),
        )
      ],
    );
  }

  Widget accountWidget() {
    ActionClick actionClickPerson = ({objectClass, url, widget}) {
      print(url);
      return Container();
    };

    final titleWidget = 'Tài khoản';
    final textStyleTitle = TextStyleApp.fontNotoSansLarge;
    List<ItemData> listItemData = [
      ItemData('Thông tin cá nhân', Icons.person_outline_sharp, actionClick: actionClickPerson(url: 'PERSON')),
      ItemData('Địa chỉ đã lưu', Icons.bookmark_border_outlined),
      ItemData('Cài đặt', Icons.settings_outlined),
      ItemData('Đăng xuất', Icons.output)
    ];
    Widget listItemWidget = ListItemWidget().listItemOption(listItemData);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.0.wp, bottom: 5.0.wp),
          child: Text(
            titleWidget,
            style: textStyleTitle,
          ),
        ),
        Container(
          child: listItemWidget,
        )
      ],
    );
  }

  Widget supportWidget() {
    final titleWidget = 'Hỗ trợ';
    final textStyleTitle = TextStyleApp.fontNotoSansLarge;
    List<ItemData> listItemData = [
      ItemData('Đánh giá đơn hàng', Icons.star_border),
      ItemData('Liên hệ góp ý', Icons.messenger_outline_sharp),
      ItemData('Hướng dẫn xuất hóa đơn GTGT', Icons.document_scanner_outlined)
    ];

    Widget listItemWidget = ListItemWidget().listItemOption(listItemData);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.0.wp, bottom: 5.0.wp),
          child: Text(
            titleWidget,
            style: textStyleTitle,
          ),
        ),
        Container(
          child: listItemWidget,
        )
      ],
    );
  }

  Widget extensionWidget() {
    final titleWidget = 'Tiện ích';
    final textStyleTitle = TextStyleApp.fontNotoSansLarge;
    List<ItemData> list = [ItemData('Lịch sử đơn hàng', Icons.history), ItemData('Điều khoản', Icons.document_scanner_outlined), ItemData('Điều khỏan vay VNPay', Icons.document_scanner_outlined)];
    Widget listItemWidget = ListItemWidget().listItemOptionGridView(list);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.0.wp, bottom: 3.0.wp),
          child: Text(
            titleWidget,
            style: textStyleTitle,
          ),
        ),
        Container(
          child: listItemWidget,
        )
      ],
    );
  }
}
