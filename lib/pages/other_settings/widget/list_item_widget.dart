import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';



class ItemData {
  String? url;
  String nameItem;
  String? description;
  IconData iconsItem;
  final void Function (String url, String title)? actionClick;

  ItemData(this.nameItem, this.iconsItem, {this.actionClick, this.url, this.description});
}

class ListItemWidget {
  Widget listItemOption(List<ItemData> list) {
    final textStyle = TextStyleApp.fontNotoSansTitle;
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.backgourdWhite,
        boxShadow: [
          BoxShadow(
              blurStyle: BlurStyle.outer,
              spreadRadius: 0.3.wp,
              color: ColorApp.backgourdGrey.withOpacity(0.2),
              offset: Offset(0.0, 1.0))
        ],
        borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(list.length, (index) {
          return GestureDetector(
            onTap: () {
              list.elementAt(index).actionClick != null ? list.elementAt(index).actionClick!( list.elementAt(index).url!,list.elementAt(index).nameItem,) : null;
            },
            child: Container(
                margin: EdgeInsets.all(1.5.wp),
                child: Container(
                  margin: EdgeInsets.all(1.0.wp),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: ColorApp.backgourdGrey.withOpacity(0.2),
                              width: 0.1.wp))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.all(1.5.wp),
                          child: Icon(
                            list.elementAt(index).iconsItem,
                            size: 5.0.wp,
                          )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(top: 1.0.wp, bottom: 1.0.wp),
                        child: Text(
                          list.elementAt(index).nameItem,
                          style: textStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                      Container(
                          margin: EdgeInsets.all(1.5.wp),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 5.0.wp,
                          ))
                    ],
                  ),
                )),
          );
        }),
      ),
    );
  }

  Widget listItemOptionGridView(List<ItemData> list) {
    final textStyle = TextStyleApp.fontNotoSansTitle;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate((list.length / 2 + 1).toInt(), (index) {
          return Container(
            margin: EdgeInsets.only(top: 3.0.wp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                         list.elementAt(index).actionClick != null ? list.elementAt(index).actionClick!( list.elementAt(index).url!,list.elementAt(index).nameItem,) : null;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
                            color: ColorApp.backgourdWhite),
                        padding: EdgeInsets.all(2.0.wp),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(2.0.wp),

                              child:
                              Icon(list.elementAt(index).iconsItem, size: 7.0.wp),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 2.0.wp, left: 2.0.wp),
                              child: Text(
                                list.elementAt(index).nameItem,
                                style: textStyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                (index + 1) * 2 <= list.length ? Container(width: 3.0.wp,) : Container(),
                (index + 1) * 2 <= list.length ? Expanded(
                  child: GestureDetector(
                    onTap: () {
                      list.elementAt((index + 1) * 2 ).actionClick != null ? list.elementAt((index + 1) * 2 ).actionClick!( list.elementAt((index + 1) * 2 ).url!,list.elementAt((index + 1) * 2 ).nameItem,) : null;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
                          color: ColorApp.backgourdWhite),
                      padding: EdgeInsets.all(2.0.wp),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(2.0.wp),
                            child: Icon(
                                list.elementAt((index + 1) * 2).iconsItem,
                                size: 7.0.wp),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 2.0.wp, left: 2.0.wp),
                            child: Text(
                              list.elementAt((index + 1) * 2).nameItem,
                              style: textStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ) : Container()
              ],
            ),
          );
        }));
  }



  Widget listItemOptionContact(List<ItemData> list) {
    final textStyle = TextStyleApp.fontNotoSansTitle;
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.backgourdWhite,
        boxShadow: [
          BoxShadow(
              blurStyle: BlurStyle.outer,
              spreadRadius: 0.3.wp,
              color: ColorApp.backgourdGrey.withOpacity(0.2),
              offset: Offset(0.0, 1.0))
        ],
        borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(list.length, (index) {
          return GestureDetector(
            onTap: () {
              list.elementAt(index).actionClick != null ? list.elementAt(index).actionClick!( list.elementAt(index).url!,list.elementAt(index).nameItem,) : null;
            },
            child: Container(
                margin: EdgeInsets.all(1.5.wp),
                child: Container(
                  margin: EdgeInsets.all(1.0.wp),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: ColorApp.backgourdGrey.withOpacity(0.2),
                              width: 0.1.wp))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.all(1.5.wp),
                          child: Icon(
                            list.elementAt(index).iconsItem,
                            size: 5.0.wp,
                          )),
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 1.0.wp, bottom: 1.0.wp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  list.elementAt(index).nameItem,
                                  style: textStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  list.elementAt(index).description!,
                                  style: textStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.all(1.5.wp),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 5.0.wp,
                          ))
                    ],
                  ),
                )),
          );
        }),
      ),
    );
  }
}
