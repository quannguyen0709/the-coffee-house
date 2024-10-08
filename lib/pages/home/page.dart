import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/generated/json/base/json_convert_content.dart';
import 'package:the_coffee_house_leanning/pages/home/logic.dart';
import 'package:the_coffee_house_leanning/pages/home/widget/post_view_page.dart';
import 'package:the_coffee_house_leanning/pages/manager_page/logic.dart';
import 'package:the_coffee_house_leanning/widgets/carousel_slider/carousel_silde.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_item_blog/item_blog_widget.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_item_order/item_order_wiget.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_list_item/list_item_widget.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_list_item/searchBar.dart';
import 'package:the_coffee_house_leanning/widgets/image_widget/image_widget.dart';

import '../../repository/model/new_feed/new_feed.dart';
import '../../routes/app_routes.dart';

class HomePage extends GetView {
  final HomeController controller = Get.find<HomeController>();
  final ManagerPageController managerPageController = ManagerPageController();
  double padding = 5.0.wp;

  HomePage({super.key});

  // test barnch dev
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).viewPadding.top;
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorApp.backgourdWhite,
      body: Obx(() => body(height)),
    );
  }

  AppBar appBar() {
    return AppBar();
  }

  Widget body(double heightStastusBar) {
    if (controller.managerControll.value) {
      controller.itemScrollControllerScreen
          .scrollTo(index: 0, duration: Duration(seconds: 1));
      controller.managerControll.value = false;
    }
    final lengthListWidgetBodySliver = controller.listIndexLive;
    final listWidgetFilter = List<Widget>.generate(
        controller.listMenu.length, (index) => listItemOrderFilter(index));
    final List<Widget> listWidgetInBodySliver = [
      loginWidget(),
      CarouselSliderWidget(
        height: 20.0.hp,
        itemList: controller.itemListCarouselSilder,
      ),
      Container(
        margin: EdgeInsets.only(bottom: 2.0.wp),
        height: 33.0.hp,
        child: listBlogPost(),
      ),
      ListItem(
          toolBar: true,
          indexLive: lengthListWidgetBodySliver,
          list: controller.listMenu,
          actionItem: controller.actionClickButton,
          favoriteButton: buttonFavorite(controller.actionClickButton),
          searchBar: SearchBarWidget(
            actionClick: controller.actionClickButton,
            height: 3.0.hp,
          )),
      for (Widget listFliterWidget in listWidgetFilter) listFliterWidget
    ];
    return Stack(children: [
      Container(
          margin: EdgeInsets.only(top: 8.0.hp + heightStastusBar),
          child: ScrollablePositionedList.builder(
            addAutomaticKeepAlives: true,
            minCacheExtent: 0,
            shrinkWrap: true,
            itemCount: listWidgetInBodySliver.length,
            itemBuilder: (context, index) {
              if(index == 0){
                return Obx(() {
                  return Container(height: controller.checkUserEmpty.value ?   27.0.hp : 1.0 ,child: listWidgetInBodySliver.first);
                },);
              }else{
                return listWidgetInBodySliver.elementAt(index);
              }

            },
            itemScrollController: controller.itemScrollControllerScreen,
            itemPositionsListener: controller.itemPositionsListenerScreen,
          )),
      Positioned(
        child: Obx(() => Container(
            padding: EdgeInsets.only(top: heightStastusBar),
            height: 8.0.hp + heightStastusBar,
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
            child: Container(
              padding: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
              child: Row(
                children: [
                  widgetLeading(controller.checkChangeIcon.value,
                      controller.firstIndex.value),
                  Spacer(),
                  widgetAction(controller.checkChangeIcon.value,
                      controller.firstIndex.value)
                ],
              ),
            ))),
      ),
    ]);
  }

  Widget loginWidget() {
    final textStyleTitle = TextStyleApp.fontNotoSansTitle;
    final textStyleButton = TextStyleApp.fontNotoSansTitle;
    final title =
        'Sử dụng app để tính điểm và đổi những ưu đãi chỉ dành riêng ch thành viên bạn nhé!';
    final textButton = 'ĐĂNG NHẬP';
    return Container(
      margin: EdgeInsets.all(5.0.wp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ShapeApp.full),
          gradient: LinearGradient(
            colors: [
              ColorApp.primaryColorSwatch.shade800,
              ColorApp.orangeBackground
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          )),
      height: 27.0.hp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin:
                  EdgeInsets.only(right: 5.0.wp, left: 5.0.wp, bottom: 5.0.wp),
              child: Text(
                title,
                softWrap: true,
                textAlign: TextAlign.center,
                style: textStyleTitle.copyWith(color: ColorApp.backgourdWhite),
              )),
          GestureDetector(
            onTap: () {
              managerPageController.routePageBack = AppRoutes.HOME;
              Get.toNamed(AppRoutes.LOGIN_PAGE);
            },
            child: Container(
              width: 60.0.wp,
              padding: EdgeInsets.all(2.0.wp),
              decoration: BoxDecoration(
                  color: ColorApp.backgourdWhite.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(ShapeApp.full)),
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
              child: Text(
                textButton,
                style: textStyleButton.copyWith(color: ColorApp.backgourdWhite),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listItemOrderFilter(int index) {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: (6 / 10),
      crossAxisCount: 2,
    );
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
          gridDelegate: gridDelegate,
          itemCount: listProduct.length,
          itemBuilder: (context, indexProduct) {
            return ItemOrderWidget(
                id: controller.listMenu.elementAt(index)[2] +
                    '_' +
                    listProduct.elementAt(indexProduct).id,
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
          height: 27.0.hp,
          child: ListView.builder(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: listPost.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.actionClickButton(listPost.keys.elementAt(index),
                      TypeAction.BLOCK_ITEM_BLOG);
                },
                child: ItemBlogWidget(
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
                ),
              );
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
    return Container(
      height: 5.0.hp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLabel,
            style: textStyle,
          ),
          GestureDetector(
            onTap: () {
              Get.to(PostViewPage(
                  newFeed: controller.listNewFeed,
                  actionClickButton: controller.actionClickButton));
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
      ),
    );
  }

  widgetLeading(bool check, int index) {
    final TextStyle textStyle = TextStyleApp.fontNotoSansTitle;
    final IconData icon = Icons.keyboard_arrow_down;

    switch (check) {
      case false:
        return Center(
          child: Row(
            children: [
              Text(
                'Mày ei, Hi-Tea đi!',
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Icon(icon)
            ],
          ),
        );
      case true:
        return GestureDetector(
          onTap: () {
            actionItemAppBar(
                '',
                Get.context!,
                controller.itemScrollControllerScreen,
                controller.listIndexLive);
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
            GestureDetector(
              onTap: () {
                // controller.appModel.userModel.checkEmptyUser =
                //     !controller.appModel.userModel.checkEmptyUser;
              },
              child: Container(
                  padding: EdgeInsets.only(right: 5.0.wp),
                  child: Icon(
                    iconSearch,
                    size: 6.0.wp,
                  )),
            ),
            Icon(
              iconFavorite,
              size: 6.0.wp,
            )
          ],
        );
      case false:
        return Container(
          height: 12.0.wp,
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(2.0.wp),
                decoration: BoxDecoration(
                    color: ColorApp.backgourdWhite,
                    borderRadius: BorderRadius.circular(ShapeApp.full),
                    border: Border.all(
                        color: ColorApp.textGrey.withAlpha(30),
                        width: 0.6.wp,
                        strokeAlign: BorderSide.strokeAlignInside)),
                child: Row(
                  children: [
                    Icon(
                      iconDiscount,
                      color: ColorApp.primaryColorSwatch,
                      size: 5.5.wp,
                    ),
                    Container(
                      width: 1.0.wp,
                    ),
                    controller.checkUserEmpty.value
                        ? Container()
                        : Text(
                            textDiscount.toString(),
                            style: TextStyleApp.fontNotoSansTitle,
                          )
                  ],
                ),
              ),
              Container(
                width: 2.0.wp,
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2.0.wp),
                      decoration: BoxDecoration(
                          color: ColorApp.backgourdWhite,
                          borderRadius: BorderRadius.circular(ShapeApp.full),
                          border: Border.all(
                              color: ColorApp.textGrey.withAlpha(30),
                              width: 0.6.wp,
                              strokeAlign: BorderSide.strokeAlignInside)),
                      child: Icon(
                        iconNotification,
                        size: 5.5.wp,
                      ),
                    ),
                    controller.checkUserEmpty.value
                        ? Container()
                        : Positioned(
                            bottom: 6.0.wp,
                            left: 6.0.wp,
                            child: Container(
                                padding: EdgeInsets.all(0.3.wp),
                                decoration: BoxDecoration(
                                    color: ColorApp.redIcon,
                                    borderRadius:
                                        BorderRadius.circular(5.0.wp)),
                                child: Text(
                                  textDiscount.toString(),
                                  style: TextStyleApp.fontNotoSansDescription
                                      .copyWith(
                                          color: Colors.white, fontSize: 8),
                                )),
                          )
                  ],
                ),
              )
            ],
          ),
        );
    }
  }

  void actionItemAppBar(String idAction, BuildContext context,
      ItemScrollController controllerScroll, int indexLive) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return GestureDetector(
          onVerticalDragCancel: () {
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
                              style: TextStyleApp.fontNotoSansLarge.copyWith(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(Get.context!);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5.0.wp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.close,
                                      size: 8.0.wp,
                                    )
                                  ],
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
                          controller.listMenu.length,
                          (index) =>
                              itemList(index, controllerScroll, indexLive)),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }

  Widget itemList(
      int index, ItemScrollController controllerScroll, int indexLive) {
    return GestureDetector(
      onTap: () {
        controllerScroll.jumpTo(index: index + indexLive);
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
                style: TextStyleApp.fontNotoSansDescription
                    .copyWith(color: Colors.black12.withAlpha(100)),
              ),
            )
          ],
        ),
      ),
    );
  }

  listItemOrderFilterOrderPage(int index) {
    TextStyle textStyle =
        TextStyleApp.fontNotoSansTitle.copyWith(fontSize: 18.0);
    final listProduct =
        controller.listProductMenuId(controller.listMenu.elementAt(index)[2]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp),
          child: Text(
            controller.listMenu.elementAt(index)[1],
            style: textStyle,
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listProduct.length,
          itemBuilder: (context, indexProduct) {
            return ItemOrderWidget(
                id: controller.listMenu.elementAt(index)[2] +
                    '_' +
                    listProduct.elementAt(indexProduct).id,
                height: 30.0.wp,
                width: 100.0.wp,
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
