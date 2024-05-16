import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/repository/model/app_model.dart';
import 'package:the_coffee_house_leanning/widgets/image_widget/image_widget.dart';

import '../../repository/model/menu /menu.dart';
import '../../repository/model/new_feed/new_feed.dart';
import '../../service/internet/check_internet.dart';

class HomeController extends GetxController{
  ScrollController controllerScroll = ScrollController();
  List<String> itemListCarouselSilder =[];
   List<dynamic> listMenu= [];
   final chekcInternet = Get.find<CheckInernet>();
   AppModel appModel = AppModel().instance;
  Map<String, Product> listProduct = {};
  List<NewFeed> listNewFeed = [];
  Map<String, Post> listPost = {};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  void loadData(){
     listProduct = appModel.listProducts;
     listNewFeed = appModel.newFeed;

    int length = (appModel.mediaBox.length / 2).round();
    for(int i = length ; i <appModel.mediaBox.length ; i++){
      itemListCarouselSilder.add(appModel.mediaBox.elementAt(i).icon);
    }

    appModel.menu.forEach((element) {
      listMenu.add([widgetImageNetWork(element.thumbnail), element.name, element.id]);
    });

    appModel.newFeed.forEach((elementNewFeed) {
      String nameNewFeed =  elementNewFeed.name + ":";
      elementNewFeed.listPost.forEach((elementPost) {
        listPost.addAll({nameNewFeed+elementPost.id : elementPost});
      });
    });


  }

  List<Post> listPostByGroupName (String id){
    List<Post> listPostByName = [];
    listPost.forEach((key, value) {
      if(id == (key.split(':')[0])){
        listPostByName.add(value);
      }
    });
    return listPostByName;
  }


  List<Product> listProductMenuId(String id){
    List<Product> listProducMenu = [];
    listProduct.forEach((key, value) {
      if(id == (key.split(' ')[0])){
        listProducMenu.add(value);
      }
    });
    return listProducMenu;
  }

  void actionClick(String idAction){

  }




  // Future<Widget> widgetImage(String image)async{
  //   return  Container(child: Image(image: AssetImage(image),fit: BoxFit.cover,),decoration: BoxDecoration(
  //     color: Colors.blue,
  //     borderRadius: BorderRadius.only(
  //       topLeft: Radius.circular(15.0),
  //       bottomRight: Radius.circular(15.0),
  //   )));
  // }





}