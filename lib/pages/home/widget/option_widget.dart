import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/home/widget/widget.dart';

import '../../../config/theme/color/color_app.dart';
import '../../../repository/model/menu /menu.dart';

class ListOptionWidget extends StatelessWidget {
  final List<Option> listOption;
  int basePrice;
  final void Function (int basePriceChose) actionChoseOption;
  int singleChosePrice = 0;
  int multiChosePrice = 0;
  ListOptionWidget({required this.listOption, required this.basePrice, required  this.actionChoseOption});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return optionProductWidget();
  }

  Widget optionProductWidget() {
    return ListView.builder(
      itemCount: listOption.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            listOptionWidget(listOption.elementAt(index)),
            (listOption.elementAt(index).groupId == "0" && listOption.elementAt(index).listItems.length == 1 ) ?  SpaceWidget(0.0.wp, ColorApp.backgourdGrey,) : SpaceWidget(2.0.wp, ColorApp.backgourdGrey,),
          ],
        );
      },
    );
  }

  Widget listOptionWidget(Option elementAt) {
    TextStyle textStyleLarge = TextStyleApp.fontNotoSansLarge.copyWith(fontWeight: FontWeight.w900);
    TextStyle textStyleTitle = TextStyleApp.fontNotoSansTitle.copyWith(color: ColorApp.textGrey);
    Widget listItem = Container(
      height: 100.0.hp,
      color: Colors.black12,
    );
    if (elementAt.groupId == "0") {
      listItem = listItemSingleOption(elementAt);
      return elementAt.listItems.length ==  1 ? SpaceWidget(
        0.0.wp,
        ColorApp.backgourdGrey,
      ) :  Container(
        padding: EdgeInsets.all(5.0.wp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              elementAt.name,
              style: textStyleLarge,
            ),
            Text(
              elementAt.description,
              style: textStyleTitle,
            ),
            listItem,
          ],
        ),
      );
    } else if (elementAt.groupId == "1") {
      listItem = listItemMultiOption(elementAt);
      return Container(
        padding: EdgeInsets.all(5.0.wp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              elementAt.name,
              style: textStyleLarge,
            ),
            Text(
              elementAt.description,
              style: textStyleTitle,
            ),
            listItem,
          ],
        ),
      );
    } else{
      return Container();
    }

  }

  Widget listItemSingleOption(Option elementAt) {
    IconData iconCheck = Icons.radio_button_checked_rounded;
    IconData icon = Icons.radio_button_off;
    Item itemCheck = elementAt.listItems.elementAt(elementAt.defaultIndex);
    TextStyle textStyleDescription = TextStyleApp.fontNotoSansTitle
        .copyWith(color: ColorApp.textGrey, fontWeight: FontWeight.w700);
    Color activeColor = ColorApp.primaryColor;
    return StatefulBuilder(
      builder: (context, setState) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: elementAt.listItems.length,
          itemBuilder: (context, index) {
            singleChosePrice = elementAt.listItems
                .elementAt(index)
                .price;
            actionChoseOption(basePrice + singleChosePrice + multiChosePrice);
            final check = itemCheck.id == elementAt.listItems[index].id;
            return GestureDetector(
              onTap: () {
                setState(() {
                  itemCheck = elementAt.listItems.elementAt(index);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10.0.wp,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            check ? iconCheck : icon,
                            color:
                            check ? activeColor : ColorApp.backgourdGrey,
                            size: 5.0.wp,
                          ),
                          SizedBox(width: 5.0.wp,),
                          Expanded(
                              child: Text(
                                elementAt.listItems.elementAt(index).name,
                                style: textStyleDescription,
                              )),
                          Text(
                              ('${elementAt.listItems
                                  .elementAt(index)
                                  .price + basePrice} đ'),
                              style: textStyleDescription
                          )
                        ],
                      ),
                    ),
                  ),
                  (index +1 == elementAt.listItems.length) ? Container() : Divider()
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget listItemMultiOption(Option elementAt) {
    IconData iconCheck = Icons.check_box;
    IconData icon = Icons.check_box_outline_blank;
    Color activeColor = ColorApp.primaryColor;
    TextStyle textStyleDescription = TextStyleApp.fontNotoSansTitle
        .copyWith(color: ColorApp.textGrey, fontWeight: FontWeight.w700);
    List<Item> listItemCheck = [];
    List<bool> check = [];

    return StatefulBuilder(
      builder: (context, setState) {
        check.clear();
        for (var element in elementAt.listItems) {
          if (listItemCheck.contains(element)) {
            check.add(true);
            multiChosePrice = multiChosePrice + element.price;
          } else {
            check.add(false);
          }
        }
        actionChoseOption(basePrice + singleChosePrice + multiChosePrice);
        return Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: elementAt.listItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (listItemCheck.length < elementAt.max) {
                    if (listItemCheck
                        .contains(elementAt.listItems.elementAt(index))) {
                      setState(() {
                        listItemCheck
                            .remove(elementAt.listItems.elementAt(index));
                      });
                    } else {
                      setState(() {
                        listItemCheck.add(elementAt.listItems.elementAt(index));
                      });
                    }
                  } else if (listItemCheck.length == elementAt.max) {
                    if (listItemCheck
                        .contains(elementAt.listItems.elementAt(index))) {
                      setState(() {
                        listItemCheck
                            .remove(elementAt.listItems.elementAt(index));
                      });
                    } else {
                      setState(() {});
                    }
                  } else {
                    setState(() {});
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 10.0.wp,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              check.elementAt(index) ? iconCheck : icon,
                              color: check.elementAt(index)
                                  ? activeColor
                                  : ColorApp.backgourdGrey,
                              size: 5.0.wp,
                            ),
                            SizedBox(width: 5.0.wp,),
                            Expanded(
                                child: Text(
                                  elementAt.listItems.elementAt(index).name,
                                  style: textStyleDescription,
                                )),
                            Text(
                              ('${elementAt.listItems.elementAt(index).price } đ'),
                              style: textStyleDescription,
                            ),
                          ],
                        ),
                      ),
                    ),
                    (index +1 == elementAt.listItems.length) ? Container() : Divider()
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
