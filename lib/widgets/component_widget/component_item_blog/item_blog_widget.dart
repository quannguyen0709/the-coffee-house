import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';

import '../../../pages/home/logic.dart';

class ItemBlogWidget extends StatelessWidget {
  final double height;
  final double width;
  final Widget image;
  final String title;
  final String description;
  final String time;
  bool? checkDescription ;

  ItemBlogWidget(
      {required this.height,
      required this.description,
      required this.width,
      required this.image,
      required this.time,
      required this.title,
      this.checkDescription
      });

  @override
  Widget build(BuildContext context) {
    checkDescription = checkDescription == null ;
    // TODO: implement build
    if (width <= 50.0.wp) {
      return itemBlogColum();
    } else {
      return itemBlogRow();
    }
  }

  Widget itemBlogColum() {
    final magin = 5.0.wp;
    final TextStyle textStyleDescription =
        TextStyleApp.fontNotoSansDescription.copyWith(color: ColorApp.textGrey,decoration:  TextDecoration.none);
    final TextStyle textStyleTitle = TextStyleApp.fontNotoSansTitle.copyWith(color: ColorApp.blackPrimary,decoration:  TextDecoration.none);
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(left:  magin, right:  magin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: width,
            child: image,
          ),
          checkDescription! ?  Text(description, style: textStyleDescription) : Container(),
          Text(title, style: textStyleTitle, overflow: TextOverflow.ellipsis),
          timeWidget(),
        ],
      ),
    );
  }

  Widget itemBlogRow() {
    return Container();
  }

  Widget timeWidget() {
    const icon = Icons.calendar_month_outlined;
    final double magin = 2.0.wp;
    final TextStyle textStyle = TextStyleApp.fontNotoSansDescription
        .copyWith(color: ColorApp.textGrey, fontSize: 14, decoration: TextDecoration.none);
    final double iconSize = 18.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        Container(
            margin: EdgeInsets.only(left: magin),
            child: Text(
              time,
              style: textStyle,
            ))
      ],
    );
  }
}
