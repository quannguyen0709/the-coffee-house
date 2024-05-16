import 'package:the_coffee_house_leanning/call_api_service/model/menu/menu_entity.dart';

class Menu{
  final String id;
  final String name;
  final String title;
  final String thumbnail;
  final List<Product> listProducts;

  Menu(this.id, this.name, this.title, this.thumbnail, this.listProducts);
}



class Product{
  final String id;
  final String name;
  final String description;
  final List<Option> listOptions;
  final int basePrice;
  final String thumbnail;
  final List<String> image;

  Product(this.id, this.name, this.description, this.listOptions,
      this.basePrice, this.thumbnail, this.image);

}


class Option{
  String groupId;
  String name;
  String description;
  int min;
  int max;
  int defaultIndex;
  List<Item> listItems;

  Option(this.groupId, this.name, this.description, this.min, this.max,
      this.defaultIndex, this.listItems);
  
  

}

class Item{
  int price;
  int id;
  String name;

  Item(this.price, this.id, this.name);
  
  

}