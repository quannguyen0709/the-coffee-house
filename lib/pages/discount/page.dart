import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/discount/logic.dart';
import 'package:the_coffee_house_leanning/pages/discount/widget/list_item_widget.dart';
import 'package:the_coffee_house_leanning/pages/discount/widget/ticket_clipper_widget.dart';
import 'package:the_coffee_house_leanning/pages/discount/widget/voucher_bottom_sheet.dart';
import 'package:the_coffee_house_leanning/pages/discount/widget/voucher_page.dart';
import 'package:the_coffee_house_leanning/pages/discount/widget/voucher_widget.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';
import 'package:the_coffee_house_leanning/routes/app_pages.dart';
import 'package:the_coffee_house_leanning/routes/app_routes.dart';

import '../../config/theme/text/text_app.dart';
import '../../repository/model/rank_infor/rank_infor_model.dart';

class DiscountPage extends GetView<DiscountController> {
  final ManagerPageController managerPageController = ManagerPageController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: bodyPage(context),
    );
  }

  Widget bodyPage(BuildContext context) {
    final heightStatusBar = AppConstants.heightStatusBar(context);
    return Container(
      color: ColorApp.backgourdGrey.withOpacity(0.1),
      height: 100.0.hp,
      width: 100.0.wp,
      child: Obx(() => controller.checkUser.value ? bodyNoLogin(context, heightStatusBar) : bodyHasUser(context, heightStatusBar)),
    );
  }

  Widget bodyHasUser(BuildContext context, double heightStatusBar) {
    return Container(
      padding: EdgeInsets.only(
          top: heightStatusBar + 5.0.wp, right: 5.0.wp, left: 5.0.wp),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 5.0.wp),
                child: Text(
                  'Ưu đãi',
                  style: TextStyleApp.fontNotoSansLarge
                      .copyWith(fontSize: 25, color: Colors.black),
                )),
            actionWidgetHasUser(),
            discountWidget()
          ],
        ),
      ),
    );
  }

  Widget actionWidgetHasUser() {
    final textStyleTitle = TextStyleApp.fontNotoSansLarge;
    List<ItemData> list = [
      ItemData(
        ColorApp.primaryColorSwatch.shade100,
        'Hạng thành viên',
        Icons.add_card_outlined,
      ),
      ItemData(ColorApp.redIcon, 'Đổi Bean', Icons.wallet_giftcard),
      ItemData(ColorApp.primaryColorSwatch.shade900, 'Lịch sử BEAN',
          Icons.coffee_outlined),
      ItemData(ColorApp.buleIcon, 'Quyền lợi của bạn', Icons.security_sharp)
    ];
    Widget listItemWidget = ListItemWidget().listItemOptionGridView(list);
    return Container(
      child: listItemWidget,
    );
  }

  Widget discountWidget() {
    final textStyleTitle = TextStyleApp.fontNotoSansLarge;
    final textStyleDescription = TextStyleApp.fontNotoSansTitle
        .copyWith(color: ColorApp.primaryColorSwatch.shade700);
    ;
    final textTitle = 'Phiếu ưu đãi của bạn';
    final textDescription = 'Xem tất cả';

    return Container(
      margin: EdgeInsets.only(top: 5.0.wp),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    textTitle,
                    style: textStyleTitle,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final list = controller.appModel.dicount;
                  Get.to(VoucherPage(listDiscount: list));
                },
                child: Container(
                  height: 9.0.wp,
                  width: 30.0.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ShapeApp.full),
                      color: ColorApp.primaryColorSwatch.shade50),
                  alignment: Alignment.center,
                  child: Text(
                    textDescription,
                    style: textStyleDescription,
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(3, (index) {
              return GestureDetector(
                onTap: () {
                  BottomSheetVoucher().bottomSheetItemOrder(Get.context!,
                      controller.appModel.dicount.elementAt(index));
                },
                child: Container(
                    margin: EdgeInsets.only(top: 2.5.wp, bottom: 2.5.wp),
                    child: VoucherWidget()
                        .item(controller.appModel.dicount.elementAt(index))),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget bodyNoLogin(BuildContext context, double heightStatusBar) {
    return Container(
      padding: EdgeInsets.only(
          top: heightStatusBar + 5.0.wp, right: 5.0.wp, left: 5.0.wp),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loginWidget(),
          Container(
            height: 10.0.wp,
          ),
          rankWidget(),
          Container(
            height: 20.0.wp,
          )
        ],
      )),
    );
  }

  Widget loginWidget() {
    final textStyleTitle = TextStyleApp.fontNotoSansTitle;
    final textStyleButton = TextStyleApp.fontNotoSansTitle;
    final title =
        'Sử dụng app để tính điểm và đổi những ưu đãi chỉ dành riêng ch thành viên bạn nhé!';
    final textButton = 'ĐĂNG NHẬP';
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ShapeApp.full),
          gradient: LinearGradient(
            colors: [
              ColorApp.primaryColorSwatch.shade800,
              ColorApp.orangeBackground
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          )),
      height: 27.0.hp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin:
                  EdgeInsets.only(right: 5.0.wp, left: 5.0.wp, bottom: 5.0.wp),
              child: Text(
                title,
                softWrap: true,
                textAlign: TextAlign.center,
                style: textStyleTitle.copyWith(color: ColorApp.backgourdWhite),
              )),
          GestureDetector(
            onTap: () {
              managerPageController.routePageBack = AppRoutes.DISCOUNT;
               Get.toNamed(AppRoutes.LOGIN_PAGE);
            },
            child: Container(
              width: 60.0.wp,
              padding: EdgeInsets.all(2.0.wp),
              decoration: BoxDecoration(
                  color: ColorApp.backgourdWhite.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(ShapeApp.full)),
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
              child: Text(
                textButton,
                style: textStyleButton.copyWith(color: ColorApp.backgourdWhite),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget rankWidget() {
    final title1 = 'Thăng hạng dễ dàng ';
    final title2 = 'Quyền lợi đa dạng & hấp dẫn';
    final textStyle = TextStyleApp.fontNotoSansLarge.copyWith(fontSize: 20);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title1,
                  style: textStyle,
                ),
                Text(
                  title2,
                  style: textStyle,
                )
              ],
            ),
          ),
          Container(height: 5.0.wp),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(controller.rankInfor.length, (index) {
                return Obx(
                  () => Expanded(
                      child: GestureDetector(
                    onTap: () {
                      controller.selectRankInfor.value =
                          controller.rankInfor.elementAt(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: (controller.selectRankInfor.value.id ==
                                  (index + 1).toString())
                              ? Border.all(
                                  color:
                                      ColorApp.backgourdGrey.withOpacity(0.2))
                              : null,
                          borderRadius:
                              BorderRadius.circular(ShapeApp.extraLarge)),
                      padding: EdgeInsets.only(
                          right: 1.0.wp,
                          left: 1.0.wp,
                          top: 2.0.wp,
                          bottom: 2.0.wp),
                      margin: EdgeInsets.all(1.0.wp),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(controller.pathDirectory +
                              controller.rankInfor.elementAt(index).icon),
                          Container(
                            height: 2.0.wp,
                          ),
                          Center(
                              child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            controller.rankInfor.elementAt(index).name,
                            style: TextStyleApp.fontNotoSansDescription,
                          ))
                        ],
                      ),
                    ),
                  )),
                );
              }),
            ),
          ),
          Container(
            height: 10.0.wp,
          ),
          Obx(() => listInforRank(controller.selectRankInfor.value.listBenefit))
          //listInforRank()
        ],
      ),
    );
  }

  Widget listInforRank(List<Benefit> list) {
    final textStyle = TextStyleApp.fontNotoSansDescription;
    return list.isEmpty
        ? Container()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(list.length, (index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: ColorApp.backgourdGrey.withOpacity(0.2)))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: 2.0.wp,
                          bottom: 2.0.wp,
                          right: 5.0.wp,
                        ),
                        height: 10.0.wp,
                        width: 10.0.wp,
                        child: Image.asset(controller.pathDirectory +
                            list.elementAt(index).icon)),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 12.0.wp,
                        child: Text(
                          list.elementAt(index).name,
                          style:
                              textStyle.copyWith(color: ColorApp.backgourdGrey),
                          softWrap: true,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          );
  }
}
