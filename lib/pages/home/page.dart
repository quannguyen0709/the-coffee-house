import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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

  Widget body(BuildContext context) {
    return CustomScrollView(
      controller: controller.controllerScroll,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        appBarSliver(),
        SliverToBoxAdapter(
          child: bodySliver(),
        )
      ],
    );
  }


  Widget appBarSliver(){
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      backgroundColor: ColorApp.backgourdWhite,
      shadowColor: Colors.black12,
      elevation: 50,
      title:  Text('CustomScrollView', style: TextStyle(color: Colors.black),),
    );

  }


  Widget bodySliver(){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CarouselSliderWidget(
            height: 20.0.hp,
            itemList: controller.itemListCarouselSilder,
          ),
          ListItem(
              list: controller.listMenu,
              actionItem: actionClickButton,
              favoriteButton: buttonFavorite(actionClickButton),
              searchBar: SearchBarWidget(
                actionClick: actionClickButton,
                height: 3.0.hp,
              )),
          Container(
            height: 35.0.hp,
            child: listBlogPost(),
          ),
          listItemOrder(),
        ],
      ),
    );
  }

  void actionClickButton() {
    print("click");
  }

  Widget listItemOrder() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: controller.listMenu.length,
      itemBuilder: (context, index) {
        return listItemOrderFilter(index);
      },
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
          margin: EdgeInsets.only(right:  5.0.wp,left:  5.0.wp),
          child: Text(
            controller.listMenu.elementAt(index)[1],
            style: textStyle,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: gridDelegate,
          itemCount: listProduct.length,
          itemBuilder: (context, indexProduct) {
            return ItemOrderWidget(
                height: 0.0,
                width: 50.0.wp,
                image: widgetImageNetWork(
                    listProduct.elementAt(indexProduct).thumbnail),
                nameItem: listProduct.elementAt(indexProduct).name,
                description:
                    listProduct.elementAt(indexProduct).basePrice.toString() + " đ",
                actionClickButton: actionClickButton,
                actionIemOrder: actionClickButton);
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
        Container(margin: EdgeInsets.only(right: 5.0.wp, left:  5.0.wp), child: widgetText()),
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
                  time: listPost[listPost.keys.elementAt(index)]!.publish.toString(),
                  title: listPost[listPost.keys.elementAt(index)]!.title.toString(),
                  actionClick: actionClickButton);
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
           actionClickButton();
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
}
