import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';

import '../../../pages/home/logic.dart';

class ItemOrderWidget extends StatelessWidget {
  final double height;
  final double width;
  final Widget image;
  final String nameItem;
  final String description;
  final String id;
  final void Function(String idAction, TypeAction action) actionClickButton;
  final void Function(String idAction, TypeAction action) actionIemOrder;

  ItemOrderWidget(
      {required this.height,
      required this.width,
      required this.image,
      required this.nameItem,
      required this.description,
      required this.actionClickButton,
      required this.actionIemOrder,
      required this.id});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (width <= 50.0.wp) {
      return Container(
          width: 40.0.wp,
          margin: EdgeInsets.all(5.0.wp),
          child: itemWidgetColum());
    } else {
      return itemWidgetRow();
    }
  }

  Widget itemWidgetColum() {
    final widthImage = 40.0.wp;
    final textStyleDescription = TextStyleApp.fontNotoSansDescription;
    final textStyleTitle = TextStyleApp.fontNotoSansTitle;
    return GestureDetector(
        onTap: () {
          actionIemOrder('widgetAction_$id', TypeAction.BLOCK_ITEM_ORDER);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: widthImage,
              height: widthImage * 1.1,
              child: image,
            ),
            Container(
              margin: EdgeInsets.only(top: 1.0.wp, bottom: 1.0.wp),
              child: Text(
                nameItem,
                style: textStyleTitle,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: textStyleDescription,
                  ),
                  Spacer(),
                  iconButton()
                ]),
          ],
        ));
  }

  Widget iconButton({double? width}) {
    final icon = Icons.add;
    final colorIcon = Colors.white;
    return SizedBox(
      height: width,
      width: width,
      child: ClipOval(
        child: Material(
          color: ColorApp.primaryColor, // Button color
          child: InkWell(
            // Splash color
            onTap: () {
              actionClickButton('iconButton_$id', TypeAction.BLOCK_ITEM_ORDER);
            },
            child: Icon(
              icon,
              color: colorIcon,
              size: width == null ? (6.0.wp) : width ,
            ),
          ),
        ),
      ),
    );
  }

  Widget itemWidgetRow() {
    final textStyleDescription = TextStyleApp.fontNotoSansDescription;
    final textStyleTitle = TextStyleApp.fontNotoSansTitle;
    return GestureDetector(
      onTap: () {
        actionIemOrder('widgetAction_$id', TypeAction.BLOCK_ITEM_ORDER);
      },
      child: Container(
        margin: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp,top: 3.0.wp, bottom: 3.0.wp),
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 3.0.wp),
              width: height*0.95,
              height: height,
              child: image,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  nameItem,
                  style: textStyleTitle,
                ),
                Text(
                  description,
                  style: textStyleDescription,
                )
              ],
            )),
            Container(
              margin: EdgeInsets.only(left: 2.0.wp),
              width: 8.0.wp,
              child: Center(child: iconButton(width: 7.0.wp)),
            )
          ],
        ),
      ),
    );
  }
}
