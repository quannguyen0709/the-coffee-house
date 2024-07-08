import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house_leanning/config/theme/color/color_app.dart';
import 'package:the_coffee_house_leanning/config/theme/shape/shape_app.dart';
import 'package:the_coffee_house_leanning/config/theme/text/text_app.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/repository/model/new_feed/new_feed.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_item_blog/item_blog_widget.dart';
import 'package:the_coffee_house_leanning/widgets/component_widget/component_item_blog/list_blog_widget.dart';

import '../../../widgets/image_widget/image_widget.dart';
import '../logic.dart';

class PostViewPage extends StatefulWidget {
  List<NewFeed> newFeed;

  final void Function(String idAction, TypeAction action, {Post? post}) actionClickButton;

  PostViewPage({required this.newFeed, required this.actionClickButton});



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PostViewPage();
  }
}

class _PostViewPage extends State<PostViewPage>  with TickerProviderStateMixin{
  late List<Widget> listTabBar;
  late int lengthNewFeed;
  late TabController tabController;
  
  int indexTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lengthNewFeed = widget.newFeed.length;
    listTabBar = List.generate(lengthNewFeed,
        (index) => tabBarList(widget.newFeed.elementAt(index).name));
    tabController = TabController(length: lengthNewFeed, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      slivers: [appTabBarSliver(), bodySliver()],
    );
  }

  Widget appTabBarSliver() {
    TextStyle textStyleAppBar = TextStyleApp.fontNotoSansLarge;
    Text titleAppBar = Text(
      'Khám phá thêm',
      style: textStyleAppBar,
    );
    return SliverAppBar(
      title: titleAppBar,
      pinned: true,
      centerTitle: true,
      bottom:  TabBar(
        isScrollable: true,
        padding: EdgeInsets.all(2.0.wp),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: ColorApp.primaryColor,
        labelColor: ColorApp.primaryColor,
        indicator: BoxDecoration( color: ColorApp.primaryColorSwatch.shade50,borderRadius: BorderRadius.circular(ShapeApp.full)),
        controller:  tabController,
        onTap: (value) {
          setState(() {
            indexTab = value;
          });
        },
        tabs: listTabBar,
      ),
    );
  }

  Widget bodySliver() {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (8/ 9),
        crossAxisCount: 2,);
    ;
    NewFeed newFeed = widget.newFeed.elementAt(indexTab);
    return SliverFillRemaining(
      hasScrollBody: true,
      child: Container(
        color: Colors.white,
        height: 100.0.hp,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: GridView.builder(
            gridDelegate: gridDelegate,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemCount: newFeed.listPost.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  widget.actionClickButton(  " ", TypeAction.BLOCK_ITEM_BLOG ,post: newFeed.listPost.elementAt(index));
                },
                child: Container(
                  padding: EdgeInsets.only(top: 1.0.wp, bottom: 1.0.wp),
                  child: ItemBlogWidget(
                      checkDescription: false,
                      height: 0.0.hp,
                      description: newFeed.listPost.elementAt(index).title,
                      width: 40.0.wp,
                      image: widgetImageNetWork(
                          newFeed.listPost.elementAt(index).thumbnail),
                      time: newFeed.listPost.elementAt(index).publish.toString(),
                      title: newFeed.listPost.elementAt(index).title),
                ),
              );
            },
          )
        ),
      ),
    );
  }

  Widget tabBarList(String nameNewFeed) {
    TextStyle textStyle = TextStyleApp.fontNotoSansTitle;
    return Container(
      margin: EdgeInsets.only(top: 2.0.wp, bottom: 2.0.wp, right: 3.0.wp, left: 3.0.wp),
      child: Text(
        nameNewFeed,
        style: textStyle,
        maxLines: 1,

      ),
    );
  }
}
