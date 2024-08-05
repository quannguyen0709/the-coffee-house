import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/shop/logic.dart';
import 'package:the_coffee_house_leanning/widgets/image_widget/image_widget.dart';

import '../../../repository/model/store/store.dart';

enum AxisScroll{COLUM_SCROLL, ROW_SCROLL, GRIDVIEW_SCROLL}

class StoreWidget extends StatelessWidget{

  final Store store;
  final AxisScroll axisScroll;
  final void Function(TypeAcotionShopPage typeAcotionShopPage, Store store)  actionClickButton;

  StoreWidget({required this.store, required  this.axisScroll, required this.actionClickButton});

  @override
  Widget build(BuildContext context) {
    switch (axisScroll){
      case AxisScroll.COLUM_SCROLL:
        return columScroll();
      case AxisScroll.ROW_SCROLL:
        return rowScroll();
      case AxisScroll.GRIDVIEW_SCROLL:
        return gridviewScroll();
    }
  }

  Widget columScroll() {
    final height = 30.0.wp;
    final infoOther = 'Chưa xác định';
    final textStyleInfoOther = TextStyleApp.fontNotoSansDescription.copyWith(color: ColorApp.textGrey.withOpacity(0.6));
    final nameStore = store.name;
    final textStyleNameStore = TextStyleApp.fontNotoSansTitle.copyWith(color: ColorApp.blackPrimary.withOpacity(0.7));
    final nameBrand = 'The Coffee House';
    final textStyleNameBrand = TextStyleApp.fontNotoSansDescription.copyWith(color: ColorApp.textGrey.withOpacity(0.8));
    return GestureDetector(
      onTap: (){
        actionClickButton(TypeAcotionShopPage.BLOCK_ITEM_STORE, store);
      },
      child: Container(
        margin: EdgeInsets.only(top: 1.0.wp, bottom: 1.0.wp),
        decoration: BoxDecoration(color: ColorApp.backgourdWhite,borderRadius: BorderRadius.circular(ShapeApp.extraLarge)),
        height:  height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 35.0.wp,
              margin: EdgeInsets.all(3.0.wp),
              child: widgetImageNetWork(store.images.first),
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.all(3.0.wp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nameBrand, style:  textStyleNameBrand,),
                      Expanded(child: Text(nameStore, style:  textStyleNameStore,)),
                      Text(infoOther, style:  textStyleInfoOther,)
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Widget rowScroll() {
    return Container();
  }

  Widget gridviewScroll() {
    return Container();
  }



}