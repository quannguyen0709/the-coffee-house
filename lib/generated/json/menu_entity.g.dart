import 'package:the_coffee_house_leanning/generated/json/base/json_convert_content.dart';
import 'package:the_coffee_house_leanning/call_api_service/model/menu/menu_entity.dart';

MenuEntity $MenuEntityFromJson(Map<String, dynamic> json) {
  final MenuEntity menuEntity = MenuEntity();
  final dynamic error = json['error'];
  if (error != null) {
    menuEntity.error = error;
  }
  final List<MenuMenu>? menu = (json['menu'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<MenuMenu>(e) as MenuMenu).toList();
  if (menu != null) {
    menuEntity.menu = menu;
  }
  return menuEntity;
}

Map<String, dynamic> $MenuEntityToJson(MenuEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['error'] = entity.error;
  data['menu'] = entity.menu.map((v) => v.toJson()).toList();
  return data;
}

extension MenuEntityExtension on MenuEntity {
  MenuEntity copyWith({
    dynamic error,
    List<MenuMenu>? menu,
  }) {
    return MenuEntity()
      ..error = error ?? this.error
      ..menu = menu ?? this.menu;
  }
}

MenuMenu $MenuMenuFromJson(Map<String, dynamic> json) {
  final MenuMenu menuMenu = MenuMenu();
  final int? style = jsonConvert.convert<int>(json['style']);
  if (style != null) {
    menuMenu.style = style;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    menuMenu.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    menuMenu.name = name;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    menuMenu.title = title;
  }
  final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
  if (thumbnail != null) {
    menuMenu.thumbnail = thumbnail;
  }
  final String? slug = jsonConvert.convert<String>(json['slug']);
  if (slug != null) {
    menuMenu.slug = slug;
  }
  final List<MenuMenuProducts>? products = (json['products'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<MenuMenuProducts>(e) as MenuMenuProducts)
      .toList();
  if (products != null) {
    menuMenu.products = products;
  }
  return menuMenu;
}

Map<String, dynamic> $MenuMenuToJson(MenuMenu entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['style'] = entity.style;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['title'] = entity.title;
  data['thumbnail'] = entity.thumbnail;
  data['slug'] = entity.slug;
  data['products'] = entity.products.map((v) => v.toJson()).toList();
  return data;
}

extension MenuMenuExtension on MenuMenu {
  MenuMenu copyWith({
    int? style,
    int? id,
    String? name,
    String? title,
    String? thumbnail,
    String? slug,
    List<MenuMenuProducts>? products,
  }) {
    return MenuMenu()
      ..style = style ?? this.style
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..title = title ?? this.title
      ..thumbnail = thumbnail ?? this.thumbnail
      ..slug = slug ?? this.slug
      ..products = products ?? this.products;
  }
}

MenuMenuProducts $MenuMenuProductsFromJson(Map<String, dynamic> json) {
  final MenuMenuProducts menuMenuProducts = MenuMenuProducts();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    menuMenuProducts.id = id;
  }
  final dynamic recommendedId = json['recommended_id'];
  if (recommendedId != null) {
    menuMenuProducts.recommendedId = recommendedId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    menuMenuProducts.name = name;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    menuMenuProducts.description = description;
  }
  final List<MenuMenuProductsOptions>? options = (json['options'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<MenuMenuProductsOptions>(
          e) as MenuMenuProductsOptions).toList();
  if (options != null) {
    menuMenuProducts.options = options;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    menuMenuProducts.price = price;
  }
  final String? basePriceStr = jsonConvert.convert<String>(
      json['base_price_str']);
  if (basePriceStr != null) {
    menuMenuProducts.basePriceStr = basePriceStr;
  }
  final String? priceStr = jsonConvert.convert<String>(json['price_str']);
  if (priceStr != null) {
    menuMenuProducts.priceStr = priceStr;
  }
  final int? basePrice = jsonConvert.convert<int>(json['base_price']);
  if (basePrice != null) {
    menuMenuProducts.basePrice = basePrice;
  }
  final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
  if (thumbnail != null) {
    menuMenuProducts.thumbnail = thumbnail;
  }
  final List<String>? images = (json['images'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (images != null) {
    menuMenuProducts.images = images;
  }
  final bool? isPickup = jsonConvert.convert<bool>(json['is_pickup']);
  if (isPickup != null) {
    menuMenuProducts.isPickup = isPickup;
  }
  final bool? isDelivery = jsonConvert.convert<bool>(json['is_delivery']);
  if (isDelivery != null) {
    menuMenuProducts.isDelivery = isDelivery;
  }
  final bool? isTable = jsonConvert.convert<bool>(json['is_table']);
  if (isTable != null) {
    menuMenuProducts.isTable = isTable;
  }
  final List<dynamic>? hintNote = (json['hint_note'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (hintNote != null) {
    menuMenuProducts.hintNote = hintNote;
  }
  final dynamic promotion = json['promotion'];
  if (promotion != null) {
    menuMenuProducts.promotion = promotion;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    menuMenuProducts.status = status;
  }
  final dynamic descriptionHtml = json['description_html'];
  if (descriptionHtml != null) {
    menuMenuProducts.descriptionHtml = descriptionHtml;
  }
  final String? slug = jsonConvert.convert<String>(json['slug']);
  if (slug != null) {
    menuMenuProducts.slug = slug;
  }
  final dynamic sPrice = json['s_price'];
  if (sPrice != null) {
    menuMenuProducts.sPrice = sPrice;
  }
  final dynamic sBasePrice = json['s_base_price'];
  if (sBasePrice != null) {
    menuMenuProducts.sBasePrice = sBasePrice;
  }
  return menuMenuProducts;
}

Map<String, dynamic> $MenuMenuProductsToJson(MenuMenuProducts entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['recommended_id'] = entity.recommendedId;
  data['name'] = entity.name;
  data['description'] = entity.description;
  data['options'] = entity.options.map((v) => v.toJson()).toList();
  data['price'] = entity.price;
  data['base_price_str'] = entity.basePriceStr;
  data['price_str'] = entity.priceStr;
  data['base_price'] = entity.basePrice;
  data['thumbnail'] = entity.thumbnail;
  data['images'] = entity.images;
  data['is_pickup'] = entity.isPickup;
  data['is_delivery'] = entity.isDelivery;
  data['is_table'] = entity.isTable;
  data['hint_note'] = entity.hintNote;
  data['promotion'] = entity.promotion;
  data['status'] = entity.status;
  data['description_html'] = entity.descriptionHtml;
  data['slug'] = entity.slug;
  data['s_price'] = entity.sPrice;
  data['s_base_price'] = entity.sBasePrice;
  return data;
}

extension MenuMenuProductsExtension on MenuMenuProducts {
  MenuMenuProducts copyWith({
    String? id,
    dynamic recommendedId,
    String? name,
    String? description,
    List<MenuMenuProductsOptions>? options,
    int? price,
    String? basePriceStr,
    String? priceStr,
    int? basePrice,
    String? thumbnail,
    List<String>? images,
    bool? isPickup,
    bool? isDelivery,
    bool? isTable,
    List<dynamic>? hintNote,
    dynamic promotion,
    int? status,
    dynamic descriptionHtml,
    String? slug,
    dynamic sPrice,
    dynamic sBasePrice,
  }) {
    return MenuMenuProducts()
      ..id = id ?? this.id
      ..recommendedId = recommendedId ?? this.recommendedId
      ..name = name ?? this.name
      ..description = description ?? this.description
      ..options = options ?? this.options
      ..price = price ?? this.price
      ..basePriceStr = basePriceStr ?? this.basePriceStr
      ..priceStr = priceStr ?? this.priceStr
      ..basePrice = basePrice ?? this.basePrice
      ..thumbnail = thumbnail ?? this.thumbnail
      ..images = images ?? this.images
      ..isPickup = isPickup ?? this.isPickup
      ..isDelivery = isDelivery ?? this.isDelivery
      ..isTable = isTable ?? this.isTable
      ..hintNote = hintNote ?? this.hintNote
      ..promotion = promotion ?? this.promotion
      ..status = status ?? this.status
      ..descriptionHtml = descriptionHtml ?? this.descriptionHtml
      ..slug = slug ?? this.slug
      ..sPrice = sPrice ?? this.sPrice
      ..sBasePrice = sBasePrice ?? this.sBasePrice;
  }
}

MenuMenuProductsOptions $MenuMenuProductsOptionsFromJson(
    Map<String, dynamic> json) {
  final MenuMenuProductsOptions menuMenuProductsOptions = MenuMenuProductsOptions();
  final int? groupId = jsonConvert.convert<int>(json['group_id']);
  if (groupId != null) {
    menuMenuProductsOptions.groupId = groupId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    menuMenuProductsOptions.name = name;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    menuMenuProductsOptions.description = description;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    menuMenuProductsOptions.min = min;
  }
  final int? max = jsonConvert.convert<int>(json['max']);
  if (max != null) {
    menuMenuProductsOptions.max = max;
  }
  final int? defaultIndex = jsonConvert.convert<int>(json['default_index']);
  if (defaultIndex != null) {
    menuMenuProductsOptions.defaultIndex = defaultIndex;
  }
  final List<MenuMenuProductsOptionsItems>? items = (json['items'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<MenuMenuProductsOptionsItems>(
          e) as MenuMenuProductsOptionsItems).toList();
  if (items != null) {
    menuMenuProductsOptions.items = items;
  }
  return menuMenuProductsOptions;
}

Map<String, dynamic> $MenuMenuProductsOptionsToJson(
    MenuMenuProductsOptions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['group_id'] = entity.groupId;
  data['name'] = entity.name;
  data['description'] = entity.description;
  data['min'] = entity.min;
  data['max'] = entity.max;
  data['default_index'] = entity.defaultIndex;
  data['items'] = entity.items.map((v) => v.toJson()).toList();
  return data;
}

extension MenuMenuProductsOptionsExtension on MenuMenuProductsOptions {
  MenuMenuProductsOptions copyWith({
    int? groupId,
    String? name,
    String? description,
    int? min,
    int? max,
    int? defaultIndex,
    List<MenuMenuProductsOptionsItems>? items,
  }) {
    return MenuMenuProductsOptions()
      ..groupId = groupId ?? this.groupId
      ..name = name ?? this.name
      ..description = description ?? this.description
      ..min = min ?? this.min
      ..max = max ?? this.max
      ..defaultIndex = defaultIndex ?? this.defaultIndex
      ..items = items ?? this.items;
  }
}

MenuMenuProductsOptionsItems $MenuMenuProductsOptionsItemsFromJson(
    Map<String, dynamic> json) {
  final MenuMenuProductsOptionsItems menuMenuProductsOptionsItems = MenuMenuProductsOptionsItems();
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    menuMenuProductsOptionsItems.code = code;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    menuMenuProductsOptionsItems.price = price;
  }
  final int? productId = jsonConvert.convert<int>(json['product_id']);
  if (productId != null) {
    menuMenuProductsOptionsItems.productId = productId;
  }
  final MenuMenuProductsOptionsItemsLocalize? localize = jsonConvert.convert<
      MenuMenuProductsOptionsItemsLocalize>(json['localize']);
  if (localize != null) {
    menuMenuProductsOptionsItems.localize = localize;
  }
  final String? val = jsonConvert.convert<String>(json['val']);
  if (val != null) {
    menuMenuProductsOptionsItems.val = val;
  }
  final bool? isMain = jsonConvert.convert<bool>(json['is_main']);
  if (isMain != null) {
    menuMenuProductsOptionsItems.isMain = isMain;
  }
  final String? priceStr = jsonConvert.convert<String>(json['price_str']);
  if (priceStr != null) {
    menuMenuProductsOptionsItems.priceStr = priceStr;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    menuMenuProductsOptionsItems.name = name;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    menuMenuProductsOptionsItems.id = id;
  }
  return menuMenuProductsOptionsItems;
}

Map<String, dynamic> $MenuMenuProductsOptionsItemsToJson(
    MenuMenuProductsOptionsItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['price'] = entity.price;
  data['product_id'] = entity.productId;
  data['localize'] = entity.localize.toJson();
  data['val'] = entity.val;
  data['is_main'] = entity.isMain;
  data['price_str'] = entity.priceStr;
  data['name'] = entity.name;
  data['id'] = entity.id;
  return data;
}

extension MenuMenuProductsOptionsItemsExtension on MenuMenuProductsOptionsItems {
  MenuMenuProductsOptionsItems copyWith({
    String? code,
    int? price,
    int? productId,
    MenuMenuProductsOptionsItemsLocalize? localize,
    String? val,
    bool? isMain,
    String? priceStr,
    String? name,
    int? id,
  }) {
    return MenuMenuProductsOptionsItems()
      ..code = code ?? this.code
      ..price = price ?? this.price
      ..productId = productId ?? this.productId
      ..localize = localize ?? this.localize
      ..val = val ?? this.val
      ..isMain = isMain ?? this.isMain
      ..priceStr = priceStr ?? this.priceStr
      ..name = name ?? this.name
      ..id = id ?? this.id;
  }
}

MenuMenuProductsOptionsItemsLocalize $MenuMenuProductsOptionsItemsLocalizeFromJson(
    Map<String, dynamic> json) {
  final MenuMenuProductsOptionsItemsLocalize menuMenuProductsOptionsItemsLocalize = MenuMenuProductsOptionsItemsLocalize();
  final String? en = jsonConvert.convert<String>(json['en']);
  if (en != null) {
    menuMenuProductsOptionsItemsLocalize.en = en;
  }
  final String? vi = jsonConvert.convert<String>(json['vi']);
  if (vi != null) {
    menuMenuProductsOptionsItemsLocalize.vi = vi;
  }
  return menuMenuProductsOptionsItemsLocalize;
}

Map<String, dynamic> $MenuMenuProductsOptionsItemsLocalizeToJson(
    MenuMenuProductsOptionsItemsLocalize entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['en'] = entity.en;
  data['vi'] = entity.vi;
  return data;
}

extension MenuMenuProductsOptionsItemsLocalizeExtension on MenuMenuProductsOptionsItemsLocalize {
  MenuMenuProductsOptionsItemsLocalize copyWith({
    String? en,
    String? vi,
  }) {
    return MenuMenuProductsOptionsItemsLocalize()
      ..en = en ?? this.en
      ..vi = vi ?? this.vi;
  }
}