import 'package:the_coffee_house_leanning/call_api_service/model/discount/discount_entity.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/media_box/media_box_entity.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/menu/menu_entity.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/new_feed/new_feeds_entity.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/stores/stores_entity.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/user/user_entity.dart';
import 'package:the_coffee_house_leanning/call_local/model/rank_infor/rank_infor_entity.dart';
import 'package:the_coffee_house_leanning/pages/discount/widget/list_item_widget.dart';
import 'package:the_coffee_house_leanning/repository/model/discount/add_discount.dart';
import 'package:the_coffee_house_leanning/repository/model/discount/discount.dart';
import 'package:the_coffee_house_leanning/repository/model/media_box/add_media_box.dart';
import 'package:the_coffee_house_leanning/repository/model/media_box/media_box.dart';
import 'package:the_coffee_house_leanning/repository/model/menu%20/add_menu.dart';
import 'package:the_coffee_house_leanning/repository/model/menu%20/menu.dart';
import 'package:the_coffee_house_leanning/repository/model/new_feed/add_new_feed.dart';
import 'package:the_coffee_house_leanning/repository/model/new_feed/new_feed.dart';
import 'package:the_coffee_house_leanning/repository/model/rank_infor/add_rank_infor.dart';
import 'package:the_coffee_house_leanning/repository/model/rank_infor/rank_infor_model.dart';
import 'package:the_coffee_house_leanning/repository/model/store/add_store.dart';
import 'package:the_coffee_house_leanning/repository/model/store/store.dart';
import 'package:the_coffee_house_leanning/repository/model/user/user_model.dart';
import 'package:the_coffee_house_leanning/repository/model/web_link/add_web_link.dart';
import 'package:the_coffee_house_leanning/repository/model/web_link/web_link.dart';

class AppModel{
   List<Menu> menu = [];
   List<Store> store = [];
   List<NewFeed> newFeed = [];
   List<MediaBox> mediaBox = [];
   List<RankInfor> rankInfor = [];
   UserModel userModel = UserModel();
   Map<String, Product>listProducts = {};
   List<DiscountModel> dicount = [];
   late WebLink webLink ;

   MenuEntity menuEntity  = MenuEntity();
   NewFeedsEntity newFeedsEntity = NewFeedsEntity();
   StoresEntity storesEntity = StoresEntity();
   UserEntity userEntity = UserEntity();
   MediaBoxEntity mediaBoxEntity = MediaBoxEntity();

   RankInforEntity rankInforEntity = RankInforEntity();

   factory AppModel(){
      return _instance;
   }

   static final AppModel _instance = AppModel._singleton();

   AppModel._singleton();


   Future addConfigApp(dynamic entity)async{
      if(entity is MenuEntity){
         menuEntity = entity;
         menu = AddMenu().addMenu(menuEntity);
         listProduct(menu);
      }
      else if( entity is NewFeedsEntity){
         newFeedsEntity = entity;
         newFeed = AddNewFeed().addNewFeed(newFeedsEntity);
      }
      else if(entity is StoresEntity){
         storesEntity = entity;
         store = AddStore().addStore(storesEntity);

      }
      else if( entity is MediaBoxEntity){
         mediaBoxEntity = entity;
         mediaBox = AddMediaBox().addMediaBox(mediaBoxEntity);
      }
      else if(entity is UserEntity){
         userEntity = entity;
      }
      else if(entity is RankInforEntity){
         rankInforEntity = entity;
         rankInfor = AddRankInfor().addRankInfor(rankInforEntity);
         webLink = AddWebLink().addWebLink(entity.webLinks!);
      }
      else if(entity is DiscountEntity){
         dicount = AddDiscount().addListDiscount(entity);
      }

    }

    listProduct(List<Menu> listMenu ){
      listMenu.forEach((element) {
         element.listProducts.forEach((elementProduct) {
            String id = "${element.id}  ${elementProduct.id}";
            listProducts.addAll({id.toString(): elementProduct});
         });
      });
    }



}