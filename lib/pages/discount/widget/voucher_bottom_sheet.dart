import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/repository/model/discount/discount.dart';

import '../../../config/theme/color/color_app.dart';

class BottomSheetVoucher {
  bool firstBuild = true;
  int numberItemSelect = 1;

  void bottomSheetItemOrder(BuildContext context, DiscountModel discountModel) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      constraints: BoxConstraints(
        maxHeight: 90.0.hp,
        maxWidth: 100.0.wp,
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          snap: true,
          minChildSize: 0.4,
          maxChildSize: 1,
          initialChildSize: 1,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              height: 90.0.hp,
              width: 100.0.wp,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 10.0.wp,
                          bottom: 10.0.wp,
                          right: 10.0.wp,
                          left: 10.0.wp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ShapeApp.full),
                          color: ColorApp.backgourdWhite),
                      child: voucherWidget(discountModel),
                    ),
                  ),
                  Container(
                    height: 90.0.hp,
                    width: 100.0.wp,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(3.0.wp),
                            width: 100.0.wp,
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.cancel,
                                  size: 7.0.wp,
                                  color: Colors.grey,
                                ))),
                        Expanded(child: Container()),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget voucherWidget(DiscountModel discountModel) {
    final textAli = TextAlign.center;
    final slipString = discountModel.time_left.split('>').isNotEmpty
        ? discountModel.time_left.split('>').elementAt(1).split('<').first
        : discountModel.time_left;
    final textStyleBrand =
        TextStyleApp.fontNotoSansTitle.copyWith(color: ColorApp.backgourdGrey);
    final textStyleTitle =
        TextStyleApp.fontNotoSansLarge.copyWith(fontSize: 20);
    final textStyleDescription = TextStyleApp.fontNotoSansDescription;
    return Container(
      padding: EdgeInsets.all(5.0.wp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10.0.wp),
              alignment: Alignment.center,
              child: Text(
                discountModel.brand,
                style: textStyleBrand,
              )),
          Container(
              margin: EdgeInsets.only(bottom: 7.0.wp),
              alignment: Alignment.center,
              child: Text(
                discountModel.title,
                style: textStyleTitle,
                softWrap: true,
                textAlign: TextAlign.center,
              )),
          Container(
            height: 50.0.wp,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                QrImageView(data: discountModel.coupons.barcode, version: QrVersions.auto, size: 35.0.wp,),
                Text(discountModel.coupons.barcode, style:  textStyleBrand.copyWith(color: ColorApp.backgourdGrey.withOpacity(0.7)),),
                Text('Sao chép', style: textStyleBrand.copyWith(color: ColorApp.buleIcon),)
              ],

            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0.wp),
            padding: EdgeInsets.only(top: 2.0.wp, bottom: 2.0.wp),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    top: BorderSide(
                        color: ColorApp.backgourdGrey.withOpacity(0.2)),
                    bottom: BorderSide(
                        color: ColorApp.backgourdGrey.withOpacity(0.2)))),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ngày hết hạn:',
                  style: textStyleBrand.copyWith(
                      color: ColorApp.backgourdGrey.withOpacity(0.7)),
                ),
                Spacer(),
                Text(
                  slipString,
                  style: textStyleBrand.copyWith(
                      color: ColorApp.primaryColorSwatch.shade700),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0.wp),
            child: Text(
              discountModel.description,
              style: textStyleDescription.copyWith(
                  color: ColorApp.backgourdGrey.withOpacity(0.7)),
            ),
          )
        ],
      ),
    );
  }
}
