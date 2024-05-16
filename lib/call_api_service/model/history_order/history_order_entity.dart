import 'package:the_coffee_house_leanning/generated/json/base/json_field.dart';
import 'package:the_coffee_house_leanning/generated/json/history_order_entity.g.dart';
import 'dart:convert';
export 'package:the_coffee_house_leanning/generated/json/history_order_entity.g.dart';

@JsonSerializable()
class HistoryOrderEntity {
	dynamic error;
	late List<HistoryOrderHistories> histories;

	HistoryOrderEntity();

	factory HistoryOrderEntity.fromJson(Map<String, dynamic> json) => $HistoryOrderEntityFromJson(json);

	Map<String, dynamic> toJson() => $HistoryOrderEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HistoryOrderHistories {
	late String ref;
	late int time;
	late int total;
	@JSONField(name: "total_str")
	late String totalStr;
	@JSONField(name: "order_type_str")
	late String orderTypeStr;
	@JSONField(name: "order_type")
	late String orderType;
	late String type;
	late int bean;
	late String image;
	late String thumbnail;
	dynamic status;
	late String message;
	@JSONField(name: "store_id")
	late int storeId;
	@JSONField(name: "store_name")
	late String storeName;
	late String address;
	late List<String> products;
	late HistoryOrderHistoriesRating rating;

	HistoryOrderHistories();

	factory HistoryOrderHistories.fromJson(Map<String, dynamic> json) => $HistoryOrderHistoriesFromJson(json);

	Map<String, dynamic> toJson() => $HistoryOrderHistoriesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HistoryOrderHistoriesRating {
	late int rating;
	late List<dynamic> attention;
	dynamic comment;

	HistoryOrderHistoriesRating();

	factory HistoryOrderHistoriesRating.fromJson(Map<String, dynamic> json) => $HistoryOrderHistoriesRatingFromJson(json);

	Map<String, dynamic> toJson() => $HistoryOrderHistoriesRatingToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}