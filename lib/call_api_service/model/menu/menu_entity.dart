import 'package:the_coffee_house_leanning/generated/json/base/json_field.dart';
import 'package:the_coffee_house_leanning/generated/json/menu_entity.g.dart';
import 'dart:convert';
export 'package:the_coffee_house_leanning/generated/json/menu_entity.g.dart';

@JsonSerializable()
class MenuEntity {
	dynamic error;
	late List<MenuMenu> menu;

	MenuEntity();

	factory MenuEntity.fromJson(Map<String, dynamic> json) => $MenuEntityFromJson(json);

	Map<String, dynamic> toJson() => $MenuEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MenuMenu {
	late int style;
	late int id;
	late String name;
	late String title;
	late String thumbnail;
	late String slug;
	late List<MenuMenuProducts> products;

	MenuMenu();

	factory MenuMenu.fromJson(Map<String, dynamic> json) => $MenuMenuFromJson(json);

	Map<String, dynamic> toJson() => $MenuMenuToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MenuMenuProducts {
	late String id;
	@JSONField(name: "recommended_id")
	dynamic recommendedId;
	late String name;
	late String description;
	late List<MenuMenuProductsOptions> options;
	late int price;
	@JSONField(name: "base_price_str")
	late String basePriceStr;
	@JSONField(name: "price_str")
	late String priceStr;
	@JSONField(name: "base_price")
	late int basePrice;
	late String thumbnail;
	late List<String> images;
	@JSONField(name: "is_pickup")
	late bool isPickup;
	@JSONField(name: "is_delivery")
	late bool isDelivery;
	@JSONField(name: "is_table")
	late bool isTable;
	@JSONField(name: "hint_note")
	late List<dynamic> hintNote;
	dynamic promotion;
	late int status;
	@JSONField(name: "description_html")
	dynamic descriptionHtml;
	late String slug;
	@JSONField(name: "s_price")
	dynamic sPrice;
	@JSONField(name: "s_base_price")
	dynamic sBasePrice;

	MenuMenuProducts();

	factory MenuMenuProducts.fromJson(Map<String, dynamic> json) => $MenuMenuProductsFromJson(json);

	Map<String, dynamic> toJson() => $MenuMenuProductsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MenuMenuProductsOptions {
	@JSONField(name: "group_id")
	late int groupId;
	late String name;
	late String description;
	late int min;
	late int max;
	@JSONField(name: "default_index")
	late int defaultIndex;
	late List<MenuMenuProductsOptionsItems> items;

	MenuMenuProductsOptions();

	factory MenuMenuProductsOptions.fromJson(Map<String, dynamic> json) => $MenuMenuProductsOptionsFromJson(json);

	Map<String, dynamic> toJson() => $MenuMenuProductsOptionsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MenuMenuProductsOptionsItems {
	late String code;
	late int price;
	@JSONField(name: "product_id")
	late int productId;
	late MenuMenuProductsOptionsItemsLocalize localize;
	late String val;
	@JSONField(name: "is_main")
	late bool isMain;
	@JSONField(name: "price_str")
	late String priceStr;
	late String name;
	late int id;

	MenuMenuProductsOptionsItems();

	factory MenuMenuProductsOptionsItems.fromJson(Map<String, dynamic> json) => $MenuMenuProductsOptionsItemsFromJson(json);

	Map<String, dynamic> toJson() => $MenuMenuProductsOptionsItemsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MenuMenuProductsOptionsItemsLocalize {
	late String en;
	late String vi;

	MenuMenuProductsOptionsItemsLocalize();

	factory MenuMenuProductsOptionsItemsLocalize.fromJson(Map<String, dynamic> json) => $MenuMenuProductsOptionsItemsLocalizeFromJson(json);

	Map<String, dynamic> toJson() => $MenuMenuProductsOptionsItemsLocalizeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}