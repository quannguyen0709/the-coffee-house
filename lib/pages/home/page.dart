import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/home/logic.dart';
import 'package:the_coffee_house_leanning/widgets/carousel_slider/carousel_silde.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_item_blog/item_blog_widget.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_item_order/item_order_wiget.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_list_item/list_item_widget.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_list_item/searchBar.dart';
import 'package:the_coffee_house_leanning/widgets/image_widget/image_widget.dart';

import '../../repository/model/new_feed/new_feed.dart';

class HomePage extends GetView<HomeController> {
  double padding = 5.0.wp;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: ColorApp.backgourdWhite, body: body(context));
  }

  Widget body(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        appBarSliver(),
        SliverFillRemaining(
          child: Obx(() {
            return bodySliver();
          }),
        )
      ],
    );
  }

  Widget appBarSliver() {
    return SliverAppBar(
        pinned: true,
        floating: false,
        snap: false,
        shadowColor: Colors.black12,
        expandedHeight: 6.0.hp,
        toolbarHeight: 6.0.hp,
        flexibleSpace: Expanded(
          child: Obx(() => Container(
                decoration: controller.checkChangeIcon.value
                    ? null
                    : BoxDecoration(
                        gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          ColorApp.primaryColorSwatch.shade50,
                          ColorApp.primaryColorSwatch.shade50,
                          ColorApp.primaryColorSwatch.shade50,
                          ColorApp.primaryColorSwatch.shade50.withAlpha(50),
                          ColorApp.backgourdWhite
                        ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      )),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        right: 5.0.wp, left: 5.0.wp, top: 2.0.hp),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        widgetLeading(controller.checkChangeIcon.value,
                            controller.firstIndex.value),
                        Spacer(),
                        widgetAction(controller.checkChangeIcon.value,
                            controller.firstIndex.value)
                      ],
                    ),
                  ),
                ),
              )),
        ));
  }

  Widget bodySliver() {
    final check = controller.managerControll;
    if (check.value) {
      controller.itemScrollControllerScreen
          .scrollTo(index: 0, duration: Duration(seconds: 1));
      check.value = false;
    }
    final lengthListWidgetBodySliver = controller.listIndexLive;
    final listWidgetFilter = List<Widget>.generate(
        controller.listMenu.length, (index) => listItemOrderFilter(index));
    final List<Widget> listWidgetInBodySliver = [
      CarouselSliderWidget(
        height: 20.0.hp,
        itemList: controller.itemListCarouselSilder,
      ),
      Container(
        height: 35.0.hp,
        child: listBlogPost(),
      ),
      ListItem(
          indexLive: lengthListWidgetBodySliver,
          list: controller.listMenu,
          actionItem: controller.actionClickButton,
          favoriteButton: buttonFavorite(controller.actionClickButton),
          searchBar: SearchBarWidget(
            actionClick: controller.actionClickButton,
            height: 3.0.hp,
          )),
    ];
    return ScrollablePositionedList.builder(
      scrollOffsetListener: controller.scrollOffsetListener,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: listWidgetInBodySliver.length + listWidgetFilter.length,
      itemBuilder: (context, index) {
        if (index < listWidgetInBodySliver.length) {
          return listWidgetInBodySliver[index];
        } else {
          return listWidgetFilter[index - listWidgetInBodySliver.length];
        }
      },
      itemScrollController: controller.itemScrollControllerScreen,
      itemPositionsListener: controller.itemPositionsListenerScreen,
    );
  }

  Widget listItemOrderFilter(int index) {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (7 / 11),
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0);
    ;
    TextStyle textStyle =
        TextStyleApp.fontNotoSansTitle.copyWith(fontSize: 18.0);
    final listProduct =
        controller.listProductMenuId(controller.listMenu.elementAt(index)[2]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
          child: Text(
            controller.listMenu.elementAt(index)[1],
            style: textStyle,
          ),
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.vertical,
          gridDelegate: gridDelegate,
          itemCount: listProduct.length,
          itemBuilder: (context, indexProduct) {
            return ItemOrderWidget(
              id: controller.listMenu.elementAt(index)[2] + '_' + listProduct.elementAt(indexProduct).id,
                height: 0.0,
                width: 50.0.wp,
                image: widgetImageNetWork(
                    listProduct.elementAt(indexProduct).thumbnail),
                nameItem: listProduct.elementAt(indexProduct).name,
                description:
                    listProduct.elementAt(indexProduct).basePrice.toString() +
                        " đ",
                actionClickButton: controller.actionClickButton,
                actionIemOrder: controller.actionClickButton);
          },
        )
      ],
    );
  }

  Widget listBlogPost() {
    double height = 15.0.hp;
    double width = 35.0.wp;
    Map<String, Post> listPost = controller.listPost;
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
            child: widgetText()),
        Container(
          height: 30.0.hp,
          child: ListView.builder(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: listPost.length,
            itemBuilder: (context, index) {
              return ItemBlogWidget(
                  height: height,
                  description: listPost.keys.elementAt(index).split(":")[0],
                  width: width,
                  image: widgetImageNetWork(
                      listPost[listPost.keys.elementAt(index)]!.thumbnail),
                  time: listPost[listPost.keys.elementAt(index)]!
                      .publish
                      .toString(),
                  title: listPost[listPost.keys.elementAt(index)]!
                      .title
                      .toString(),
                  actionClick: controller.actionClickButton);
            },
          ),
        )
      ],
    );
  }

  Widget widgetText() {
    String textLabel = "Khám phá thêm";
    String textDetail = "xem thêm";
    TextStyle textStyle = TextStyleApp.fontNotoSansTitle.copyWith(fontSize: 16);
    int maxLine = 1;
    TextOverflow textOverflow = TextOverflow.ellipsis;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          textLabel,
          style: textStyle,
        )),
        GestureDetector(
          onTap: () {
            controller.actionClickButton(
                'Khams phas ',
                context: Get.context,
                TypeAction.BLOCK_ITEM_BLOG);
          },
          child: Row(
            children: [
              Container(
                width: 15.0.wp,
                child: Text(
                  textDetail,
                  style: textStyle.copyWith(color: ColorApp.primaryColor),
                  overflow: textOverflow,
                  maxLines: maxLine,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: ColorApp.primaryColor,
              )
            ],
          ),
        )
      ],
    );
  }

  widgetLeading(bool check, int index) {
    final TextStyle textStyle = TextStyleApp.fontNotoSansTitle;
    final IconData icon = Icons.keyboard_arrow_down;

    switch (check) {
      case false:
        return Row(
          children: [
            Text(
              'Mày ei, Hi-Tea đi!',
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Icon(icon)
          ],
        );
      case true:
        return GestureDetector(
          onTap: () {
            actionItemAppBar('', Get.context!);
          },
          child: Row(
            children: [
              SizedBox(
                width: 5.0.wp,
                child: controller.listMenu[index][0],
              ),
              Text(
                controller.listMenu[index][1],
                style: TextStyleApp.fontNotoSansLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Icon(icon)
            ],
          ),
        );
    }
  }

  Widget widgetAction(bool check, int index) {
    final IconData iconSearch = Icons.search_sharp;
    final IconData iconFavorite = Icons.favorite_border;
    final IconData iconDiscount = Icons.confirmation_num_outlined;
    final IconData iconNotification = Icons.notifications_none_outlined;

    final textDiscount = 12;

    switch (check) {
      case true:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.only(right: 5.0.wp),
                child: Icon(
                  iconSearch,
                  size: 6.0.wp,
                )),
            Icon(
              iconFavorite,
              size: 6.0.wp,
            )
          ],
        );
      case false:
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(2.0.wp),
                decoration: BoxDecoration(
                    color: ColorApp.backgourdWhite,
                    borderRadius: BorderRadius.circular(5.0.wp),
                    border: Border.all(
                        color: ColorApp.textGrey.withAlpha(30),
                        width: 0.6.wp,
                        strokeAlign: BorderSide.strokeAlignInside)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      iconDiscount,
                      color: ColorApp.primaryColorSwatch,
                      size: 5.5.wp,
                    ),
                    Text(
                      textDiscount.toString(),
                      style: TextStyleApp.fontNotoSansTitle,
                    )
                  ],
                ),
              ),
              Spacer(),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(2.0.wp),
                    decoration: BoxDecoration(
                        color: ColorApp.backgourdWhite,
                        borderRadius: BorderRadius.circular(5.0.wp),
                        border: Border.all(
                            color: ColorApp.textGrey.withAlpha(30),
                            width: 0.6.wp,
                            strokeAlign: BorderSide.strokeAlignInside)),
                    child: Icon(
                      iconNotification,
                      size: 5.5.wp,
                    ),
                  ),
                  Positioned(
                    bottom: 6.0.wp,
                    left: 6.0.wp,
                    child: Container(
                        padding: EdgeInsets.all(0.3.wp),
                        decoration: BoxDecoration(
                            color: ColorApp.redIcon,
                            borderRadius: BorderRadius.circular(5.0.wp)),
                        child: Text(
                          textDiscount.toString(),
                          style: TextStyleApp.fontNotoSansDescription
                              .copyWith(color: Colors.white, fontSize: 8),
                        )),
                  )
                ],
              )
            ],
          ),
        );
    }
  }

  void actionItemAppBar(String idAction, BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return GestureDetector(
          onVerticalDragCancel: (){
            Navigator.pop(context);
          },
          child: Container(
              width: 100.0.wp,
              height: 65.0.hp,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 15.0.wp,
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              'Danh Mục',
                              style: TextStyleApp.fontNotoSansLarge.copyWith(fontWeight: FontWeight.w900, fontSize: 20 ),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(Get.context!);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5.0.wp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [Icon(Icons.close, size: 8.0.wp,)],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Wrap(
                      children: List<Widget>.generate(
                          controller.listMenu.length, (index) => itemList(index)),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }

  Widget itemList(int index) {
    return GestureDetector(
      onTap: (){
        controller.itemScrollControllerScreen.jumpTo(index: index + controller.listIndexLive);
      },
      child: Container(
        padding: EdgeInsets.all(1.5.wp),
        child: Column(
          children: [
            Container(
              height: 10.0.hp,
              child: controller.listMenu.elementAt(index)[0],
            ),
            Container(
              width: 8.0.hp,
              child: Text(
                controller.listMenu.elementAt(index)[1],
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyleApp.fontNotoSansDescription.copyWith(color: Colors.black12.withAlpha(100)),
              ),
            )
          ],
        ),
      ),
    );
  }

/*\
  Widget listItemOrder() {
    final physics= AlwaysScrollableScrollPhysics();
    final shrinkWrap=true;
    return ScrollablePositionedList.builder(
      itemPositionsListener: controller.itemPositionsListenerItemOrder,
      itemScrollController: controller.itemScrollControllerItemOrder,
      shrinkWrap: shrinkWrap,
      scrollDirection: Axis.vertical,
      itemCount: controller.listMenu.length,
      itemBuilder: (context, index) {
        return listItemOrderFilter(index);
      },
    );
  }
   */

// Widget body() {
//   return FutureBuilder(
//     future: controller.loadImageLocalApp(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               CarouselSliderWidget(
//                       itemList: controller.itemListCarouselSilder,
//                       height: 20.0.hp)
//                   .redacted(
//                       context: context,
//                       redact: true,
//                       configuration: RedactedConfiguration(
//                         animationDuration:
//                             const Duration(milliseconds: 800), //default
//                       )),
//               Container(
//                 height: 40.0.hp,
//                 width: 100.0.wp,
//                 child: Text("loag"),
//               ).redacted(
//                   context: context,
//                   redact: true,
//                   configuration: RedactedConfiguration(
//                     animationDuration:
//                         const Duration(milliseconds: 800), //default
//                   ))
//             ],
//           ),
//         );
//       } else if (snapshot.connectionState == ConnectionState.done) {
//         return SingleChildScrollView(
//           child: Column(
//             children: [Container(
//               margin: EdgeInsets.all(padding),
//               decoration: ShadowApp.smallShadow,
//               child: CarouselSliderWidget(
//                 height: 20.0.hp,
//                 itemList: controller.itemListCarouselSilder,
//               ),
//             ),
//               Container(height: 50.0.hp, child: Text("Loaddddd")),
//             ],
//           ),
//         );
//       } else {
//         return Container();
//       }
//     },
//   );
// }
}
