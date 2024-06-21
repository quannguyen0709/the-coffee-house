import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/home/widget/option_widget.dart';
import 'package:the_coffee_house_leanning/repository/model/menu%20/menu.dart';
import 'package:the_coffee_house_leanning/widgets/image_widget/image_widget.dart';

class BottomApppSheet{
  final  priceChose = 0.obs;
  void bottomSheetItemOrder(BuildContext context, Product? productData, int basePrice) {
    priceChose.value = basePrice;
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
                      child: Column(
                        children: [
                          listImageWidget(productData!.image),
                          informationProductWidget(productData, context),
                          SpaceWidget(
                            2.0.wp,
                            ColorApp.backgourdGrey,
                          ),
                          productData.listOptions.isEmpty
                              ? SpaceWidget(
                            0.0.wp,
                            ColorApp.textGrey,
                          )
                              : ListOptionWidget(
                            listOption: productData!.listOptions,
                            basePrice: productData!.basePrice,
                            actionChoseOption: actionChoseOption,
                          ),
                          commentWidget(),
                          SpaceWidget(
                            30.0.wp,
                            ColorApp.textGrey,
                          )
                        ],
                      )),
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
                                ))),
                        Expanded(child: Container()),
                        Obx((){
                          return selectOption(productData, priceChose.value);
                        })
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

  void actionChoseOption( int priceChoseA){
    priceChose.value = priceChoseA;
  }
}

Widget selectOption(Product product, int priceChose) {
  final addIcon = Icons.add;
  final removeIcon = Icons.remove;
  final size = 6.0.wp;
  final colorIcon = ColorApp.primaryColor;
  final backgroundColor = ColorApp.primaryColorSwatch.shade50;
  final textStyle = TextStyleApp.fontNotoSansDescription;
  final styleText = TextStyleApp.fontNotoSansLarge.copyWith(
    color: ColorApp.backgourdWhite
  );
  return Container(
    height: 23.0.wp,
    color: ColorApp.backgourdWhite,
    padding: EdgeInsets.all(5.0.wp),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(alignment: Alignment.center,decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),child: Icon(removeIcon, size: size,color: colorIcon,)),
        Container(margin: EdgeInsets.all(3.0.wp),alignment: Alignment.center,child: Text('1', style:  textStyle,)),
        Container(alignment: Alignment.center,decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),child: Icon(addIcon, size: size,color: colorIcon,)),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 3.0.wp),
            decoration: BoxDecoration(color: colorIcon, borderRadius: BorderRadius.circular(ShapeApp.extraLarge)),
            child: Center(
              child: Text(
                'Chọn . ' + priceChose.toString() + 'đ',
                style: styleText,
              ),
            )
          ),
        )
      ],
    )
  );
}

Widget SpaceWidget(double height, Color color, {double? width}) {
  return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              color.withAlpha(40),
              color.withAlpha(30),
              color.withAlpha(40)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp),
      ));
}

Widget commentWidget() {
  final textLabel = 'Yêu cầu khác';
  final textDescription = 'Những tùy chọn khác';
  final textFieldDescription = 'Thêm ghi chú';
  final textStyleLabel = TextStyleApp.fontNotoSansLarge.copyWith(
      fontSize: 22, fontWeight: FontWeight.w900, color: ColorApp.blackPrimary);
  final textStyleDescription = TextStyleApp.fontNotoSansDescription
      .copyWith(color: ColorApp.textGrey, fontSize: 14);
  return Container(
    padding: EdgeInsets.all(5.0.wp),
    width: 100.0.wp,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textLabel,
          style: textStyleLabel,
        ),
        Text(
          textDescription,
          style: textStyleDescription,
        ),
        Container(
          width: 100.0.wp,
          margin: EdgeInsets.only(top: 3.0.wp),
          padding: EdgeInsets.all(2.0.wp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
              border: Border.all(color: ColorApp.textGrey)),
          child: Text(
            textFieldDescription,
            style: textStyleDescription,
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        )
      ],
    ),
  );
}

Widget informationProductWidget(Product inforData, BuildContext context) {
  final textDescription = inforData.description;
  final textStyleDescription = TextStyleApp.fontNotoSansDescription;
  final textName = inforData.name;
  final textStyleName = TextStyleApp.fontNotoSansLarge
      .copyWith(fontSize: 22, fontWeight: FontWeight.w900);
  final IconData favorite = Icons.favorite_border;
  final priceBase = inforData.basePrice;

  var checkWrapText = false;
  final end =
      (100.0.wp / TextStyleApp.fontNotoSansDescription.fontSize!.toDouble())
              .toInt() *
          3.9.round();
  final textSlip =
      '${textDescription.substring(0, (end > textDescription.length) ? textDescription.length : end)}...  ';
  var textMore = checkWrapText ? '. Rút gọn' : 'xem thêm';

  return Container(
    padding: EdgeInsets.all(5.0.wp),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textName,
                    style: textStyleName,
                  ),
                  Text(
                    priceBase.toString() + 'đ',
                    style: TextStyleApp.fontNotoSansTitle
                        .copyWith(color: ColorApp.textGrey, fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 5.0.wp, left: 3.0.wp),
                height: 12.0.wp,
                width: 12.0.wp,
                child: Icon(favorite))
          ],
        ),
        StatefulBuilder(
          builder: (context, setState) {
            return RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: checkWrapText ? textDescription : textSlip,
                    style: textStyleDescription.copyWith(
                        color: ColorApp.textGrey, fontSize: 14)),
                TextSpan(
                    text: textMore,
                    style: textStyleDescription.copyWith(
                        color: ColorApp.primaryColor, fontSize: 14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          checkWrapText = !checkWrapText;
                          textMore = checkWrapText ? '. Rút gọn' : 'xem thêm';
                        });
                      })
              ]),
              softWrap: true,
              overflow: TextOverflow.fade,
              maxLines: textDescription.length,
            );
          },
        )
      ],
    ),
  );
}

Widget listImageWidget(List<String> listImage) {
  return Container(
    color: ColorApp.textGrey,
    height: 45.0.hp,
    child: listImage.length == 1
        ? Expanded(
            child: widgetImageNetWork(listImage.first,
                height: 45.0.hp, width: 100.0.wp))
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listImage!.length,
            itemBuilder: (context, index) {
              return Expanded(
                  child: widgetImageNetWork(listImage.elementAt(index),
                      topBorder: true));
            },
          ),
  );
}
