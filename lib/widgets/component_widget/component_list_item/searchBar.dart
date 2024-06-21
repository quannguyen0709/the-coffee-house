import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';

import '../../../pages/home/logic.dart';

class SearchBarWidget extends StatelessWidget {
  final void Function(String idAction, TypeAction action) actionClick;
  final double height;
  SearchBarWidget(
      {required this.actionClick, required this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return searchBar();
  }

  Widget searchBar() {
    final shape = ShapeApp.extraLarge;
    final icon = Icons.search_sharp;
    final color = ColorApp.backgourdGrey;
    final TextAlign textAlign = TextAlign.start;
    final TextStyle textStyle = TextStyleApp.fontNotoSansTitle;
    final hintText = "Tìm kiếm";
    final padding = 2.0.wp;
    final magin = 2.0.wp;
    return Expanded(
      child: Container(
          margin: EdgeInsets.all(magin),
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
              color: color.withAlpha(20),
              borderRadius: BorderRadius.all(Radius.circular(shape))),
          child: GestureDetector(
            onTap: () {
              actionClick('search', TypeAction.BLOCK_ITEM_SEARCH);
            },
            child: Row(
              children: [
                Container(
                  width: height,
                  child: Icon(
                    icon,
                    color: color,
                    size: 0.8 * height,
                  ),
                ),
                Expanded(child: Text(hintText, style: textStyle.copyWith(color:  color),))
              ],
            ),
          )),
    );
  }
}

Widget buttonFavorite(void Function(String idAction, TypeAction action) actionButton) {
  final double widthButton = 10.0.wp;
  const IconData icon = Icons.favorite_border;
  final colorIcon = ColorApp.primaryColorSwatch.shade900;
  final colorBackground = ColorApp.primaryColorSwatch.shade50;
  const double radius = ShapeApp.extraLarge;
  final magin = 2.0.wp;
  return Container(
    margin:
        EdgeInsets.only(top: magin, bottom: magin, right: magin, left: 0),
    height: widthButton,
    width: widthButton,
    decoration: BoxDecoration(
        color: colorBackground,
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    child: GestureDetector(
      onTap: () {
        actionButton('favorite', TypeAction.BLOCK_ITEM_SEARCH);
      },
      child: Center(
        child: Icon(
          icon,
          color: colorIcon,
        ),
      ),
    ),
  );
}
