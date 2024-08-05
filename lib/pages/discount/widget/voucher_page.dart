import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/discount/widget/voucher_bottom_sheet.dart';
import 'package:the_coffee_house_leanning/pages/discount/widget/voucher_widget.dart';
import 'package:the_coffee_house_leanning/repository/model/discount/discount.dart';

import '../../../config/theme/color/color_app.dart';

class VoucherPage extends StatelessWidget {
  List<DiscountModel> listDiscount ;

  VoucherPage({required this.listDiscount});

  @override
  Widget build(BuildContext context) {
    final heightStatusBar = AppConstants.heightStatusBar(context);
    return Scaffold(
      body: bodyPage(heightStatusBar, context),
    );
  }

  Widget bodyPage(double heightStatusBar, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: heightStatusBar),
          child: Container(
            padding: EdgeInsets.all(5.0.wp),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(
                        color: ColorApp.backgourdGrey.withOpacity(0.2)))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: 7.0.wp,
                  ),
                ),
                Expanded(
                    child: Text(
                  'Phiếu ưư đãi của bạn',
                  style: TextStyleApp.fontNotoSansLarge.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ))
              ],
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(6, (index) {
              return GestureDetector(
                onTap: () {
                  BottomSheetVoucher().bottomSheetItemOrder(context,
                      listDiscount.elementAt(index));
                },
                child: Container(
                    margin: EdgeInsets.only(top: 2.5.wp, bottom: 2.5.wp),
                    child: VoucherWidget()
                        .item(listDiscount.elementAt(index ))),
              );
            })
          ),
        ))
      ],
    );
  }
}
