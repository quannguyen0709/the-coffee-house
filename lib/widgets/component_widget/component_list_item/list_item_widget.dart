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
  bool toolBar ;

  ListItem(
      {required this.indexLive,
      required this.list,
      required this.actionItem,
      required this.searchBar,
      required this.favoriteButton, required this.toolBar});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return listItem();
  }

  Widget listItem() {
    final height = 30.0.hp;
    final width = 100.0.wp;
    final magin = 5.0.wp;
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0);
    final colorBackGround = ColorApp.backgourdWhite;

    final barScroll = ScrollController();

    return  Container(
      height: height + magin*2,
      width: width,
      child: Stack(
          children: [
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
                children: [
                  Container(
                    height: 6.0.hp,
                    child: Row(
                      children: [searchBar, favoriteButton],
                    ),
                  ),
                  Expanded(
                    child: RawScrollbar(
                      thickness: 0.5.wp,
                      controller: barScroll,
                      thumbColor: ColorApp.primaryColor,
                      radius: Radius.circular(ShapeApp.extraLarge),
                      thumbVisibility:  true ,
                      child: GridView.builder(
                        controller: barScroll,
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
      ]),
    );
  }

  Widget itemWidget(int index) {
    final double widthImage = 10.0.wp;
    final double magin = 2.0.wp;


    final TextStyle textStyle = TextStyleApp.fontNotoSansDescription.copyWith(fontSize: 10.0);
    return Container(
      width: widthImage,
        height: widthImage*1.4,
        margin: EdgeInsets.all(magin),
        child: GestureDetector(
          onTap: () {
            final id = (index+ indexLive).toString() + '_' + list[index][1].toString();
            actionItem(id , TypeAction.BLOCK_ITEM_SEARCH);
          },
          child: Column(
            children: [
             Container(
               height: widthImage,
               child: image,
             ),
              Container(
                margin: EdgeInsets.only(top: 1.0.wp),
                child: Text(
                  label,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }

  Widget listItemNonToolBar(double height) {
    final barScroll = ScrollController();
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0);
    return Container(
      margin: EdgeInsets.only(top: 3.0.wp, bottom:  3.0.wp),
      height: height,
      child:  RawScrollbar(
        thickness: 0.5.wp,
        controller: barScroll,
        thumbColor: ColorApp.primaryColor,
        radius: Radius.circular(ShapeApp.extraLarge),
        thumbVisibility:  true ,
        child: GridView.builder(
          controller: barScroll,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          gridDelegate: gridDelegate,
          itemBuilder: (context, index) {
            label = list[index][1];
            image = list[index][0];
            return itemWidget(index);
          },
        ),
      )
    );
  }
}
