import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/widgets/image_widget/image_widget.dart';

import '../../../config/theme/color/color_app.dart';
import '../../../config/theme/shape/shape_app.dart';
import '../../../config/theme/text/text_app.dart';
import '../../../repository/model/store/store.dart';

class StoreBottomSheet extends StatelessWidget {
  final Store storeData;
  final Widget mapWidget;

  StoreBottomSheet({required this.storeData, required this.mapWidget});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  void bottomSheetItemOrder(BuildContext context) {
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorApp.backgourdWhite,
                          borderRadius:
                              BorderRadius.circular(ShapeApp.extraLarge)),

                    ),
                  ),
                  SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    child: storeWidgetBottom(),
                  ),
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
                                  color: Colors.grey,
                                ))),
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

  Widget storeWidgetBottom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 45.0.hp,
          child: storeData.images.length == 1
              ? widgetImageNetWork(storeData.images.first, topBorder: true)
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: storeData.images.length,
                  itemBuilder: (context, index) {
                    return Expanded(
                        child: widgetImageNetWork(
                            storeData.images.elementAt(index),
                            topBorder: true));
                  },
                ),
        ),
        Container(
          margin: EdgeInsets.all(5.0.wp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleStoreWidget(),
              infoStoreWidget(),
              mapAddressStore()
            ],
          ),
        )
      ],
    );
  }

  Widget titleStoreWidget() {
    final openTime = storeData.openTime;
    final textStyleOpenTime = TextStyleApp.fontNotoSansDescription
        .copyWith(color: ColorApp.textGrey.withOpacity(0.8));
    final nameStore = storeData.name;
    final textStyleNameStore = TextStyleApp.fontNotoSansLarge
        .copyWith(color: ColorApp.blackPrimary.withOpacity(0.7), fontSize: 20);
    final nameBrand = 'The Coffee House';
    final textStyleNameBrand = TextStyleApp.fontNotoSansDescription
        .copyWith(color: ColorApp.textGrey.withOpacity(0.8));
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            nameBrand,
            style: textStyleNameBrand,
          ),
          Text(
            nameStore,
            style: textStyleNameStore,
          ),
          Text(
            'Giờ mở cửa: $openTime',
            style: textStyleOpenTime,
          ),
          Divider()
        ],
      ),
    );
  }

  Widget infoStoreWidget() {
    final listItemCount = 4;
    final sizeIcon = 6.0.wp;
    final List<String> textList = [
      storeData.fullAddress,
      'Thêm vào danh sách yêu thích',
      'Liên hệ',
      'Chia sẻ với bạn'
    ];
    final textStyle =
        TextStyleApp.fontNotoSansTitle.copyWith(color: ColorApp.textGrey);
    final List<IconData> iconList = [
      Icons.add_location_outlined,
      Icons.favorite_border,
      Icons.call,
      Icons.share
    ];
    List<Widget> list = List.generate(listItemCount, (index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.all(1.0.wp),
              padding: EdgeInsets.all(1.0.wp),
              height: sizeIcon * 1.7,
              width: sizeIcon * 1.7,
              decoration: BoxDecoration(
                  color: ColorApp.textGrey.withOpacity(0.1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(ShapeApp.extraLarge)),
              child: Center(
                child: Icon(
                  iconList.elementAt(index),
                  size: sizeIcon,
                  color: ColorApp.blackPrimary.withOpacity(0.7),
                ),
              )),
          Expanded(
              child: Container(
            margin: EdgeInsets.all(2.0.wp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 3.0.wp),
                  child: Text(
                    textList.elementAt(index),
                    style: textStyle,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                ),
                Divider()
              ],
            ),
          ))
        ],
      );
    });
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: list));
  }

  Widget mapAddressStore() {
    return Container(
      margin: EdgeInsets.all(2.0.wp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ShapeApp.extraLarge)
      ),
      width: 100.0.wp,
      height: 0.5 * 100.0.wp,
      child: mapWidget,
    );
  }
}
