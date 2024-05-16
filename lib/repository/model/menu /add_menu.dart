import 'package:the_coffee_house_leanning/widgets/component_widget/component_item_blog/list_blog_widget.dart';

import '../../../call_api_service/model/menu/menu_entity.dart';
import 'menu.dart';

class AddMenu{
   List<Menu> listMenu  = [];
   List<Menu> addMenu(MenuEntity menuEntity){
    var listMenuEntity = menuEntity.menu;
    listMenuEntity.forEach((element) {
      listMenu.add( Menu(element.id.toString(), element.name, element.title, element.thumbnail, addLisProduct(element.products)));
    });
    return listMenu;

  }





   List<Product> addLisProduct(List<MenuMenuProducts> menuMenuProducts){
    final List<Product> listProduct = [];

    menuMenuProducts.forEach((element) {
      listProduct.add(Product(element.id, element.name, element.description, addOption(element.options), element.basePrice, element.thumbnail, element.images));
    });


    return listProduct;
  }





   List<Option> addOption(List<MenuMenuProductsOptions> listMenuMenuProductOption){
    final List<Option> listOption = [];

    listMenuMenuProductOption.forEach((element) {
      listOption.add(Option(element.groupId.toString(), element.name, element.description, element.min, element.max, element.defaultIndex, addItem(element.items)));
    });

    return listOption;
  }




   List<Item> addItem(List<MenuMenuProductsOptionsItems> menuMenuProductsOptionsItems){
    final List<Item> listItem = [];

    menuMenuProductsOptionsItems.forEach((element) {
      listItem.add(Item(element.price, element.id, element.name));
    });

    return listItem;
  }
}