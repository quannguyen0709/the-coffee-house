import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';

class ItemOrderWidget extends StatelessWidget {
  final double height;
  final double width;
  final Widget image;
  final String nameItem;
  final String description;
  final void Function() actionClickButton;
  final void Function() actionIemOrder;

  ItemOrderWidget(
      {required this.height,
      required this.width,
      required this.image,
      required this.nameItem,
      required this.description,
      required this.actionClickButton,
      required this.actionIemOrder});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (width <= 50.0.wp) {
      return Expanded(
        child: Container(
            width: 40.0.wp,
            margin: EdgeInsets.all(5.0.wp),
            child: itemWidgetColum()),
      );
    } else {
      return itemWidgetRow();
    }
  }

  Widget itemWidgetColum() {
    final widthImage = 40.0.wp;
    final textStyleDescription = TextStyleApp.fontNotoSansDescription;
    final textStyleTitle = TextStyleApp.fontNotoSansTitle;
    return  GestureDetector(
        onTap: () {
          actionIemOrder();
        },
        child:  Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: widthImage,
              height: widthImage*1.1,
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
        )
    );
  }

  Widget iconButton() {
    final icon = Icons.add;
    final colorIcon = Colors.white;
    final width = 6.0.wp;
    return SizedBox(
      height: width,
      width: width,
      child: ClipOval(
        child: Material(
          color: ColorApp.primaryColor, // Button color
          child: InkWell(
            // Splash color
            onTap: () {
              actionClickButton();
            },
            child: Icon(
              icon,
              color: colorIcon,
              size: width / 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget itemWidgetRow() {
    return Placeholder(
      fallbackWidth: width,
    );
  }
}
