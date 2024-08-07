import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/logic.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/widget/contact_page.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/widget/list_item_widget.dart';
import 'package:the_coffee_house_leanning/pages/other_settings/widget/web_view_post.dart';
import 'package:the_coffee_house_leanning/routes/app_routes.dart';

import '../../config/theme/color/color_app.dart';
import '../../config/theme/shape/shape_app.dart';
import '../../config/theme/text/text_app.dart';
import '../../constants/app.dart';

class OtherSettingPage extends GetView<OtherSettingController> {
  final ManagerPageController managerPageController = ManagerPageController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => bodyPage(context));
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              ticketIcon,
              size: heightWidget * 0.7,
              color: ColorApp.primaryColor,
            ),
            controller.checkUserEmpty.value
                ? Container()
                : Spacer(),
            controller.checkUserEmpty.value
                ? Container()
                : Text(
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
            controller.checkUserEmpty.value
                ? Container()
                : Positioned(
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
          margin: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                extensionWidget(),
                supportWidget(),
                Obx(()=> accountWidget()),
                Container(
                  height: 7.0.wp,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget accountWidget() {
    final titleWidget = 'Tài khoản';
    final textStyleTitle = TextStyleApp.fontNotoSansLarge;
    List<ItemData> listItemData = [
      ItemData('Thông tin cá nhân', Icons.person_outline_sharp,
          url: '',
          actionClick: (String url, String name) {
            managerPageController.routePageBack = AppRoutes.OTHER_SETTINGS;
        controller.checkUserEmpty.value
            ? Get.toNamed(AppRoutes.LOGIN_PAGE)
            : null;
      }),
      ItemData('Địa chỉ đã lưu', Icons.bookmark_border_outlined,url: '',
          actionClick: (String url, String name) {
            managerPageController.routePageBack = AppRoutes.OTHER_SETTINGS;
        controller.checkUserEmpty.value
            ? Get.toNamed(AppRoutes.LOGIN_PAGE)
            : null;
      }),
      ItemData('Cài đặt', Icons.settings_outlined, url: '', actionClick: (url, title) {
        managerPageController.routePageBack = AppRoutes.OTHER_SETTINGS;
      },),
      ItemData(
          controller.checkUserEmpty.value
              ? 'Đăng nhập'
              : 'Đăng xuất',url: '',
          Icons.output, actionClick: (String url, String name) {
            if(controller.checkUserEmpty.value){
              managerPageController.routePageBack = AppRoutes.OTHER_SETTINGS;
              Get.toNamed(AppRoutes.LOGIN_PAGE);
            }else if(!controller.checkUserEmpty.value ){
              controller.appModel.userModel.phone = '';
              controller.appModel.userModel.checkEmptyUser = true;
              showDialog(context: Get.context!, builder: (context) {
                return Container(
                  padding: EdgeInsets.only(top: 45.0.hp, bottom: 45.0.hp, right: 40.0.wp, left: 40.0.wp),
                  child: const LoadingIndicator(
                      indicatorType: Indicator.ballPulse, /// Required, The loading type of the widget
                      colors: const [Colors.white],       /// Optional, The color collections
                      strokeWidth: 1,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                      //backgroundColor: ColorApp.backgourdGrey,      /// Optional, Background of the widget
                      pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                  ),
                );
              },);
              Future.delayed(const Duration(seconds: 5), () {
                controller.checkUserEmpty.value = controller.appModel.userModel.checkEmptyUser;
                Get.back();
              });
            }

      })
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
      ItemData('Đánh giá đơn hàng', Icons.star_border,url: '',
          actionClick: (String url, String name) {
            managerPageController.routePageBack = AppRoutes.OTHER_SETTINGS;
        controller.checkUserEmpty.value
            ? Get.toNamed(AppRoutes.LOGIN_PAGE)
            : null;
      }),
      ItemData('Liên hệ góp ý', Icons.messenger_outline_sharp, url: '',
          actionClick: (String url, String name) {
        Get.to(ContactPage());
      }),
      ItemData('Hướng dẫn xuất hóa đơn GTGT', Icons.document_scanner_outlined,
          actionClick: controller.actionClick,
          url: controller.appModel.webLink.invoicingInstruct)
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
    List<ItemData> list = [
      ItemData('Lịch sử đơn hàng', Icons.history,url: '',
          actionClick: (String url, String name) {
            managerPageController.routePageBack = AppRoutes.OTHER_SETTINGS;
        controller.checkUserEmpty.value
            ? Get.toNamed(AppRoutes.LOGIN_PAGE)
            : null;
      }),
      ItemData('Điều khoản', Icons.document_scanner_outlined,
          actionClick: controller.actionClick,
          url: controller.appModel.webLink.term),
      ItemData('Điều khỏan vay VNPay', Icons.document_scanner_outlined,
          actionClick: controller.actionClick,
          url: controller.appModel.webLink.termVNPay)
    ];
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
