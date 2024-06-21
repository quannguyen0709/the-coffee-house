import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shadow.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_list_item/searchBar.dart';

import '../../../pages/home/logic.dart';

class ListItem extends StatelessWidget {
  late  Widget image;
  late  String label;
  final void Function(String idAction, TypeAction action) actionItem;
  final Widget searchBar;
  final Widget favoriteButton;
  final List<dynamic> list;
  final int indexLive;

  ListItem(
      {required this.indexLive,
      required this.list,
      required this.actionItem,
      required this.searchBar,
      required this.favoriteButton});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return listItem();
  }

  Widget listItem() {
    ScrollController controller = ScrollController();
    final height = 30.0.hp;
    final width = 100.0.wp;
    final magin = 5.0.wp;
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0);
    final colorBackGround = ColorApp.backgourdWhite;
    return Stack(children: [
      Container(
        margin: EdgeInsets.all(magin),
        width: width,
        height: height,
        decoration: ShadowApp.smallShadow,
      ),
      Container(
          margin: EdgeInsets.all(magin),
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(ShapeApp.extraLarge)),
              color: colorBackGround),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [searchBar, favoriteButton],
                ),
                Expanded(
                  child: RawScrollbar(

                    thickness: 0.5.wp,
                    thumbColor: ColorApp.primaryColor,
                    radius: Radius.circular(ShapeApp.extraLarge),
                    thumbVisibility:  true ,
                    controller: controller,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      gridDelegate: gridDelegate,
                      itemBuilder: (context, index) {
                        label = list[index][1];
                        image = list[index][0];
                        return itemWidget(index);
                      },
                    ),
                  ),
                )
              ]))
    ]);
  }

  Widget itemWidget(int index) {
    final double widthImage = 10.0.wp;
    final double magin = 2.0.wp;


    final TextStyle textStyle = TextStyleApp.fontNotoSansDescription.copyWith(fontSize: 10.0);
    return Expanded(
      child: Container(
          margin: EdgeInsets.all(magin),
          child: GestureDetector(
            onTap: () {
              final id = (index+ indexLive).toString() + '_' + list[index][1].toString();
              actionItem(id , TypeAction.BLOCK_ITEM_SEARCH);
            },
            child: Column(
              children: [
                Expanded(flex: 5, child: image),
                Flexible(
                  flex: 3,
                  child: Text(
                    label,
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
