import 'package:the_coffee_house_leanning/generated/json/base/json_field.dart';
import 'package:the_coffee_house_leanning/generated/json/stores_entity.g.dart';
import 'dart:convert';
export 'package:the_coffee_house_leanning/generated/json/stores_entity.g.dart';

@JsonSerializable()
class StoresEntity {
	dynamic error;
	late List<StoresStores> stores;

	StoresEntity();

	factory StoresEntity.fromJson(Map<String, dynamic> json) => $StoresEntityFromJson(json);

	Map<String, dynamic> toJson() => $StoresEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StoresStores {
	late int id;
	@JSONField(name: "pu_city")
	late String puCity;
	late String name;
	@JSONField(name: "open_time")
	late String openTime;
	late List<String> images;
	late String phone;
	late StoresStoresLocation location;
	@JSONField(name: "full_address")
	late String fullAddress;
	@JSONField(name: "service_types")
	late List<String> serviceTypes;
	@JSONField(name: "table_serve")
	late bool tableServe;
	@JSONField(name: "text_order_table")
	late String textOrderTable;

	StoresStores();

	factory StoresStores.fromJson(Map<String, dynamic> json) => $StoresStoresFromJson(json);

	Map<String, dynamic> toJson() => $StoresStoresToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StoresStoresLocation {
	late double lat;
	late double long;

	StoresStoresLocation();

	factory StoresStoresLocation.fromJson(Map<String, dynamic> json) => $StoresStoresLocationFromJson(json);

	Map<String, dynamic> toJson() => $StoresStoresLocationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}